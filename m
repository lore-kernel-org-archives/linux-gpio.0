From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 48/79] docs: driver-model: convert docs to ReST and
 rename to *.rst
Date: Mon, 22 Apr 2019 15:30:11 -0700
Message-ID: <20190422223011.GA16816@roeck-us.net>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <dbd6b1ffee1bc31c89d0816588f13a7f91bc9f66.1555938376.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dbd6b1ffee1bc31c89d0816588f13a7f91bc9f66.1555938376.git.mchehab+samsung@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jean Delvare <jdelvare@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, "David S. Miller" <davem@davemloft.net>, Julia Lawall <Julia.Lawall@lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Michal Marek <michal.lkml@markovi.net>, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, cocci@systeme.lip6.fr
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 22, 2019 at 10:27:37AM -0300, Mauro Carvalho Chehab wrote:
> Convert the various documents at the driver-model, preparing
> them to be part of the driver-api book.
> 
> The conversion is actually:
>   - add blank lines and identation in order to identify paragraphs;
>   - fix tables markups;
>   - add some lists markups;
>   - mark literal blocks;
>   - adjust title markups.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Acked-by: Julia Lawall <julia.lawall@lip6.fr>
> ---
>  Documentation/driver-api/gpio/driver.rst      |   2 +-
>  .../driver-model/{binding.txt => binding.rst} |  20 +-
>  .../driver-model/{bus.txt => bus.rst}         |  69 ++--
>  .../driver-model/{class.txt => class.rst}     |  74 ++--
>  ...esign-patterns.txt => design-patterns.rst} | 106 +++---
>  .../driver-model/{device.txt => device.rst}   |  57 +--
>  .../driver-model/{devres.txt => devres.rst}   |  50 +--
>  .../driver-model/{driver.txt => driver.rst}   | 112 +++---
>  Documentation/driver-model/index.rst          |  26 ++
>  .../{overview.txt => overview.rst}            |  37 +-
>  .../{platform.txt => platform.rst}            |  30 +-
>  .../driver-model/{porting.txt => porting.rst} | 333 +++++++++---------
>  Documentation/eisa.txt                        |   4 +-
>  Documentation/hwmon/submitting-patches.rst    |   2 +-

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>
