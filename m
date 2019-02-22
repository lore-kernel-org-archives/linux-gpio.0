From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: APUv2/v3 board support v4
Date: Fri, 22 Feb 2019 10:54:14 +0100
Message-ID: <1550829256-8831-1-git-send-email-info@metux.net>
References: <1550181897-2596-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550181897-2596-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi folks,


this is version 4 of my APUv2/APUv3 series.

changes in v4:

 * fixed spinlocks (using own field instead of gc.bgpio_lock)
 * dropped superflous dependency on GPIO_GENERIC
 * initialize gc.base = -1
 * added Reviewed-By tags

changes in v3:

 * gpio driver
   * drop unncessary gpio id checks
   * cleanup amd_fch_gpio_set()
   * move iores outside probe()
   * shorter NULL checks and correct error in probe()
 * apu board driver
   * drop unneeded init.h
   * drop unnecessary comments
   * clean up logging
   * dont need to depend on KEYBOARD_GPIO


--mtx
