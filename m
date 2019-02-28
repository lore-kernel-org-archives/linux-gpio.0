From: justinpopo6@gmail.com
Subject: [PATCH v4 0/2] iio: adc: ads7950: add gpio support
Date: Thu, 28 Feb 2019 14:16:47 -0800
Message-ID: <1551392209-20004-1-git-send-email-justinpopo6@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

Add GPIO support for ads7950.

v4
Split patch into two commits.
Refractored code to capture the state of the adc instead of only the GPIOs.
Added comments to clarify the intend of the code.
Fix improper use of mlock.

Justin Chen (2):
  iio: adc: ti-ads7950: Fix improper use of mlock
  iio: adc: ti-ads7950: add GPIO support

 drivers/iio/adc/ti-ads7950.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 209 insertions(+), 10 deletions(-)

-- 
2.7.4
