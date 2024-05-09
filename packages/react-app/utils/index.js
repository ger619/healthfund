import './Lock.json';
import { ethers } from 'ethers';

const address = '0x1e48283a1ef0f9ed61a13e8cdc7d21e0a2776188';
const provider = new ethers.providers.JsonRpcProvider('http://localhost:8545');

export const getLockContract = (address) => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    // const {ethers }
    return new ethers.Contract(address, abi, provider);

}

export const createDoctor = async (lockContract, doctorAddress, doctorName) => {
    const tx = await lockContract.createDoctor(doctorAddress, doctorName);
    await tx.wait();
}

