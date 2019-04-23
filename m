From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: sch: Add interrupt support
Date: Tue, 23 Apr 2019 13:10:42 +0200
Message-ID: <CACRpkdbAmtnZez_hYEU=bKDOKDVr5V11cmBeXQ-2JAnxrpeTqg@mail.gmail.com>
References: <cover.1555579429.git.jan.kiszka@siemens.com> <c9f40465c6effc7b8efd6cbf8461d71d80c80033.1555579429.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c9f40465c6effc7b8efd6cbf8461d71d80c80033.1555579429.git.jan.kiszka@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 18, 2019 at 11:23 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> Validated on the Quark platform, this adds interrupt support on rising
> and/or falling edges.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Since this utilizes ACPI I'd like Andy and/or Mika to say something about
it before I merge it. I don't know how ACPI irqchips are supposed to
be instantiated.

Yours,
Linus Walleij
