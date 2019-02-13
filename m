From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: APUv2/v3 board support V2
Date: Wed, 13 Feb 2019 21:57:26 +0100
Message-ID: <1550091448-28578-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, andy@infradead.org, dvhart@infradead.org, bgolaszewski@baylibre.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi folks,


this is version 2 of my APUv2/APUv3 series. Heavily reworked,
hope I've now addressed all issues of the last one.


Major changes are:
 * using gpiod_lookup_table instead of hardcoded gpio numbers
 * moved the PCHs gpio register definitions to the gpio drivers'
   header (but keeping the actual assignments in the board driver,
   as they're board speficic)
 * moved IO resource definition from board to gpio driver
   (the FCHs mmio base address could be changed, but nobody
   seems to ever do it)
 * added gpio line names
 * moved the gpio driver's pdata definitions to::
   include/linux/platform_data/gpio/gpio-amd-fch.h
 * reduced some code redundancies and various cleanups

Possibly debatable:
 * does is the assigned key code fit well ? (KEY_SETUP seemed the
   best candidate to me, but I'm open to suggestions)
 * should the pch gpio become a sub-device of some toplevel PCH
   device ? (which then could also maintain the base address, etc)

Note: the keyboard device needs separate patch for gpiod_lookup_table
support in gpio-keys-polled driver. I'll sent it separately.


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
