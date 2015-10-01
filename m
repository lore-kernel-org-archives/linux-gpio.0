From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: fix BG2CD field widths
Date: Thu, 01 Oct 2015 21:30:02 +0200
Message-ID: <560D89BA.1000203@gmail.com>
References: <56074059.10806@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56074059.10806@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Hebb <tommyhebb@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Antoine Tenart <antoine.tenart@free-electrons.com>, Wolfram Sang <wsa@the-dreams.de>
List-Id: linux-gpio@vger.kernel.org

On 27.09.2015 03:03, Thomas Hebb wrote:
> The previous register layout was incorrect, many of the fields having
> fewer bits than were needed to represent all their modes. The new layout
> is taken from the bootloader source of a BG2CD device.
>
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---
>   drivers/pinctrl/berlin/berlin-bg2cd.c | 62
> ++++++++++++++++++-----------------
>   1 file changed, 32 insertions(+), 30 deletions(-)

Applied to berlin/fixes.

There seems to be something wrong with the patch.
Please base your patches on the recent -rc1 kernel
and use git send-email. I fixed this patch manually.

Sebastian
