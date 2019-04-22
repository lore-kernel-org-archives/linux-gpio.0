From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v2 48/79] docs: driver-model: convert docs to ReST and
 rename to *.rst
Date: Mon, 22 Apr 2019 16:47:49 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1904221647060.2458@hadrien>
References: <cover.1555938375.git.mchehab+samsung@kernel.org> <dbd6b1ffee1bc31c89d0816588f13a7f91bc9f66.1555938376.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dbd6b1ffee1bc31c89d0816588f13a7f91bc9f66.1555938376.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, "David S. Miller" <davem@davemloft.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

> diff --git a/scripts/coccinelle/free/devm_free.cocci b/scripts/coccinelle/free/devm_free.cocci
> index b2a2cf8bf81f..e32236a979a8 100644
> --- a/scripts/coccinelle/free/devm_free.cocci
> +++ b/scripts/coccinelle/free/devm_free.cocci
> @@ -2,7 +2,7 @@
>  /// functions.  Values allocated using the devm_functions are freed when
>  /// the device is detached, and thus the use of the standard freeing
>  /// function would cause a double free.
> -/// See Documentation/driver-model/devres.txt for more information.
> +/// See Documentation/driver-model/devres.rst for more information.
>  ///
>  /// A difficulty of detecting this problem is that the standard freeing
>  /// function might be called from a different function than the one

Acked-by: Julia Lawall <julia.lawall@lip6.fr>



> --
> 2.20.1
>
>
