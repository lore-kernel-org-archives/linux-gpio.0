From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/28] gpio: drop owner assignment from platform_drivers
Date: Wed, 14 Jan 2015 09:15:31 +0100
Message-ID: <CACRpkdYNTNzfyamgcjVBBTAre+eSQJPKUKEJej-NrBhXi-iibg@mail.gmail.com>
References: <1419196495-9626-1-git-send-email-wsa@the-dreams.de>
	<1419196495-9626-8-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1419196495-9626-8-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Dec 21, 2014 at 10:14 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> This platform_driver does not need to set an owner, it will be populated by the
> driver core.
>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Patch applied, thanks!

Yours,
Linus Walleij
