From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/1] gpio: add driver for Mellanox BlueField GPIO controller
Date: Fri, 22 Feb 2019 10:12:22 +0100
Message-ID: <CACRpkdYRdOwcV4iHPTNoDraocpjeSk-eSzvMnMjSQcsLZ3ok6g@mail.gmail.com>
References: <cover.1550783880.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550783880.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 21, 2019 at 10:33 PM Shravan Kumar Ramani
<sramani@mellanox.com> wrote:

> Regarding the suggested use of the generic MMIO library, I noticed that
> bgpio_init only allows for either dirin or dirout to be set, never both.
> But since our controller has 2 separate registers, using bgpio_init
> might not be possible here.

OK let's just fix that instead of working around it, I will
send a patch.

Yours,
Linus Walleij
