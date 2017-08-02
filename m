From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] gpio: ml-ioh: use devres for irq generic chip
Date: Wed, 2 Aug 2017 13:39:05 +0200
Message-ID: <CACRpkdYvAMXUum46fNRg8CX6V893SQdRnooeYjvtfeM7pfr_5A@mail.gmail.com>
References: <20170802075126.17637-1-brgl@bgdev.pl> <20170802075126.17637-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170802075126.17637-3-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2017 at 9:51 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Use resource managed variants of irq_alloc_generic_chip() and
> irq_setup_generic_chip().
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Patch applied.

Yours,
Linus Walleij
