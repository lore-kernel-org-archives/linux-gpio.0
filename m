From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] pinctrl: meson-gxl: add tsin_a pins
Date: Thu, 8 Jun 2017 15:49:34 +0200
Message-ID: <ed2befab-728b-6165-a86b-deb92f220996@suse.de>
References: <20170608130948.16426-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170608130948.16426-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Am 08.06.2017 um 15:09 schrieb Jerome Brunet:
> Add Tsin A pins to bank DV and X.
> We don't have a driver for the tsin yet but since the tsin A pinmux is
> enabled by default at boot time, declaring this pinmux is required to
> properly operate on GPIOX.
> 
> Without this change, GPIOX 8, 9, 10 and 11 can't be driven as GPIO output
> as the tsin A seems to have priority.

Should this get a Fixes header then for stable backports?

> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c | 36 +++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Looks OK AFAICT.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
