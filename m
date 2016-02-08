From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Salvator-X ravb failure with v4.5-rc3 due to irqchip power down
Date: Mon, 8 Feb 2016 19:31:36 +0100
Message-ID: <CAMuHMdUHiBfYDrA_=wq3DwyN1dOb-af_cuhCNaWZjvHSmMfg2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On r8a7795/salvator-x, ravb Ethernet fails on v4.5-rc3 with:

    ravb e6800000.ethernet eth0: limited PHY to 100Mbit/s
    Micrel KSZ9031 Gigabit PHY e6800000.etherne:00: attached PHY
driver [Micrel KSZ9031 Gigabit PHY]
(mii_bus:phy_addr=e6800000.etherne:00, irq=202)
    ata1: link resume succeeded after 1 retries
    ata1: SATA link down (SStatus 0 SControl 300)
    Waiting up to 110 more seconds for network.
    Waiting up to 100 more seconds for network.
    ...

On success, it would continue with:

    ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
    Sending DHCP requests ., OK
    IP-Config: Got DHCP answer from [ ... ]

This problem started when commit d5c3d84657db57bd ("net: phy: Avoid
polling PHY with PHY_IGNORE_INTERRUPTS") was merged into mainline.
Reverting it fixes the
problem, or rather the symptom.

The real problem is that the PHY interrupt is wired to an on-chip GPIO
controller, which is disabled by PM Runtime if no GPIOs are in use, and
interrupts are not taken into account (the irqchip subsystem is not (yet) PM
Runtime aware) for GPIO use.

Adding a call to

    pm_runtime_get_sync(dev);

to gpio_rcar_probe() fixes the problem, but keeps the GPIO modules enabled
all the time.

IIRC, we have a similar issue with HDMI on r8a7791/koelsch...

Gr{oetje,eeting}s,

                        Geert
