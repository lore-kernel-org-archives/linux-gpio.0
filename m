From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: ACPI: remove gpio_to_desc() usage
Date: Wed, 12 Feb 2014 17:16:37 +0100
Message-ID: <CACRpkdZm1pdJxfyDn3mYaYVNQT=TDGh1oyLBQjBfVziJ8drY3A@mail.gmail.com>
References: <1391935435-29002-1-git-send-email-acourbot@nvidia.com>
	<1391935435-29002-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391935435-29002-2-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Feb 9, 2014 at 9:43 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> gpio_to_desc() must die. Replace one of its usage by the
> newly-introduced gpiochip_get_desc() function.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied with Mika's review tag.

Yours,
Linus Walleij
