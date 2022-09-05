import { useEffect, useState } from "react";
import Head from "next/head";
import Image from "next/image";
import styles from "../styles/Home.module.css";
import Coffee from "../public/Coffee.png";

export default function Home() {
  return (
    <div>
      <Head>
        <title>Buy Me A Coffee</title>
        <meta name="description" content="Buy me a coffee site" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main>
        <div className={styles.navbar}>
          <button>Connect Wallet</button>
        </div>
        <h1>
          Buy Arpita A Coffee!
        </h1>
        <div className={styles.content}>
          <div className={styles.left}></div>
          <div className={styles.right}>
            <input />
          </div>
        </div>
      </main>
    </div>
  );
}
