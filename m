From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] USB: serial: gpio line-name fix and FT232R CBUS gpio support
Date: Sun, 30 Sep 2018 14:27:01 +0200
Message-ID: <20180930122703.7115-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Karoly Pados <pados@pados.hu>, Loic Poulain <loic.poulain@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Turns out gpiolib still doesn't like having non-unique line names, so
drop the line names from the recently added FTX cbus gpio
implementation before adding support also for FT232R.

Linus, we finally got around to adding gpio support for FTDI devices;
see commit 

	ba93cc7da896 ("USB: serial: ftdi_sio: implement GPIO support for FT-X devices")
	
in my usb-next branch (and linux-next).

The gpiolib warnings and inability to use the legacy sysfs interface
prevents us from setting the line names however as someone is bound to
plugin more than one of these devices at some point. I think we
discussed this issue with the name space and hotpluggable devices a few
years ago, but looks like this topic may need to be revisited.

Thanks,
Johan


Johan Hovold (2):
  USB: serial: ftdi_sio: fix gpio name collisions
  USB: serial: ftdi_sio: add support for FT232R CBUS gpios

 drivers/usb/serial/ftdi_sio.c | 45 +++++++++++++++++++++++++++++------
 drivers/usb/serial/ftdi_sio.h |  3 ++-
 2 files changed, 40 insertions(+), 8 deletions(-)

-- 
2.19.0
