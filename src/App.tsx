import detectEthereumProvider from '@metamask/detect-provider'
import { useEffect, useState } from 'react'
import Web3 from 'web3'
import './styles/app.css'

declare global {
  interface Window {
    web3?: any
    ethereum?: any
  }
}

interface IWeb3Api {
  provider: any
  web3: Web3 | null
}

function App() {
  const [web3Api, setWeb3Api] = useState<IWeb3Api>({
    provider: null,
    web3: null,
  })

  const [account, setAccount] = useState<string | null>(null)

  const requestAccounts = async () => {
    const accounts = await window.ethereum.request({
      method: 'eth_requestAccounts',
    })
    console.log(accounts)
  }

  useEffect(() => {
    const loadProvider = async () => {
      const provider: any = await detectEthereumProvider()

      if (provider) {
        setWeb3Api({
          web3: new Web3(provider),
          provider,
        })
      } else {
        console.log('Please install Metamask.')
      }

      // if (window.ethereum) {
      //   provider = window.ethereum

      //   try {
      //     await provider.request({
      //       method: 'eth_requestAccounts',
      //     })
      //   } catch (error) {
      //     console.log(error)
      //   }
      // } else if (window.web3) {
      //   provider = window.web3.currentProvider
      // } else if (!process.env.production) {
      //   provider = new Web3.providers.HttpProvider('http://localhost:7545')
      // }
    }
    loadProvider()
  }, [])

  useEffect(() => {
    const getAccounts = async () => {
      const accounts = await web3Api.web3?.eth.getAccounts()
      if (accounts) {
        setAccount(accounts[0])
      }
    }

    web3Api.web3 && getAccounts()
  }, [web3Api.web3])

  return (
    <>
      <div className='faucet-wrapper'>
        <div className='faucet'>
          <span>Account address: </span>
          <div>
            <strong>
              {account ? (
                account
              ) : (
                <button
                  className='button is-primary mt-2 is-small'
                  onClick={() =>
                    web3Api.web3?.provider?.request({
                      method: 'eth_requestAccounts',
                    })
                  }
                >
                  Connect
                </button>
              )}
            </strong>
          </div>
          <div className='balance-view is-size-3'>
            <p>
              Current balance: <strong>10</strong> ETH
            </p>
          </div>
          {/* <button className='btn mr-2' onClick={requestAccounts}>
            Enable Ethereum
          </button> */}
          <button className='button is-primary mr-2'>Donate</button>
          <button className='button is-warning'>Withdraw</button>
        </div>
      </div>
    </>
  )
}

export default App
