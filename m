From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: remove obsolete tnetv107x driver
Date: Wed, 5 Mar 2014 09:52:29 +0800
Message-ID: <CACRpkdaBMozNayXXyn8Ag+GUU_+C2j4X7aVuaZjgV_krCvSy0A@mail.gmail.com>
References: <1393418614-3968549-1-git-send-email-arnd@arndb.de>
	<1393418614-3968549-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393418614-3968549-3-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Sekhar Nori <nsekhar@ti.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, Cyril Chemparathy <cyril@ti.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 26, 2014 at 8:43 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> The tnetv107x platform is getting removed, so this driver won't
> be needed any more.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

Can I have an ACK from some Sekhar to apply this
to the GPIO tree, so we are all aligned?

Or do you want my ACK to take this through ARM SoC?
In that case Acked-by...

Yours,
Linus Walleij
