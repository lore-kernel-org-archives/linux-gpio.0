From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] drivers: provide devm_platform_ioremap_resource()
Date: Wed, 20 Feb 2019 12:16:50 +0100
Message-ID: <20190220111650.GA13077@kroah.com>
References: <20190220111240.10041-1-brgl@bgdev.pl>
 <20190220111240.10041-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190220111240.10041-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 20, 2019 at 12:12:39PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There are currently 1200+ instances of using platform_get_resource()
> and devm_ioremap_resource() together in the kernel tree.
> 
> This patch wraps these two calls in a single helper. Thanks to that
> we don't have to declare a local variable for struct resource * and can
> omit the redundant argument for resource type. We also have one
> function call less.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
