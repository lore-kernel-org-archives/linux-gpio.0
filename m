From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/4] pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable drive-strength
Date: Tue, 13 Sep 2016 16:03:10 +0200
Message-ID: <20160913140314.22035-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: linux-gpio@vger.kernel.org

Hi,

This series adds support to control the drive strength for none GPIO 
pins. All pins expect one (FSCLKST) which can have its drive strength 
controlled is now supported. I have also added the new pins to the 
correct groups, or added groups to mimic other sh-pfc drivers. One 
notable exception is the group avb_mdc which on other SoC are called 
avb_mdio, see commit for explanation.

I did not add FSCLKST since I can't figure out which physical pin it's 
mapped to. Looking at the code that is already there and documentation 
it should be a GPIO pin controlled by IPSR7[15:12] but the documentation 
and code is lacking that part and I can't with a 100% certainty figure 
out which physical pin it is.

The series is based on top of v4.8-rc5 and tested on Salvator-X. My test 
is a bit crude and is setting a few of the AVB pins to a higher 
drive-strength value then the others and observing that the AVB fails to 
work after the pfc settings are applied (NFS root failing to mount after 
kernel is fetched over TFTP).

Niklas Söderlund (4):
  pinctrl: sh-pfc: Support named pins with custom configuration
  pinctrl: sh-pfc: r8a7795: Support none GPIO pins with configurable
    drive-strength
  pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins
  pinctrl: sh-pfc: r8a7795: Add group for QSPI0 and QSPI1 pins

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 254 ++++++++++++++++++++++++++++++++---
 drivers/pinctrl/sh-pfc/sh_pfc.h      |   8 ++
 2 files changed, 243 insertions(+), 19 deletions(-)

-- 
2.9.3
