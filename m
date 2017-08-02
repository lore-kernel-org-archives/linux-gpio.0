From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 4/6] gpio: mxc: use devres for irq generic chip
Date: Wed, 02 Aug 2017 10:09:54 +0200
Message-ID: <2153314.vmO4TSUiTO@ws-stein>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802075126.17637-5-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

On Wednesday 02 August 2017 09:51:24, Bartosz Golaszewski wrote:
> Use resource managed variants of irq_alloc_generic_chip() and
> irq_setup_generic_chip().

Is this really useful for drivers which can only be built-in? This is probably 
valid for the other drives as well.

Best regards,
Alexander
