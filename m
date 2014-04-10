From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio / ACPI: Don't crash on NULL chip->dev
Date: Thu, 10 Apr 2014 18:06:01 +0200
Message-ID: <CACRpkdZ4zndoCPSvdhMru6hofeCb0ivSVfy1dPckdnfeWUrL4g@mail.gmail.com>
References: <1396268209-19108-1-git-send-email-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396268209-19108-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 31, 2014 at 2:16 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> Commit aa92b6f689ac (gpio / ACPI: Allocate ACPI specific data directly in
> acpi_gpiochip_add()) moved ACPI handle checking to acpi_gpiochip_add() but
> forgot to check whether chip->dev is NULL before dereferencing it.
>
> Since chip->dev pointer is optional we can end up with crash like following:

Sorry for taking so long before getting to it, patch applied for fixes.

Yours,
Linus Walleij
