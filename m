From: justinpopo6@gmail.com
Subject: [PATCH v5 0/2] iio: adc: ads7950: add gpio support
Date: Fri,  8 Mar 2019 14:03:26 -0800
Message-ID: <1552082608-42603-1-git-send-email-justinpopo6@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, bgolaszewski@baylibre.com, linus.walleij@linaro.org, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-kernel@vger.kernel.org, Justin Chen <justinpopo6@gmail.com>
List-Id: linux-gpio@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

v5
Fixed ordering of how things are initalized.
Fixed incomplete cleanup on error.
Fixed double mutex_unlock.

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
