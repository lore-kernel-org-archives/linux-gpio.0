From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 1/3] gpio: dwapb: remove name from dwapb_port_property
Date: Fri, 29 Apr 2016 11:22:21 +0200
Message-ID: <CACRpkdaS3+6ZJS0MJk-j4J3j2mKC-MULgCbS8Dqy=4_toy-x9Q@mail.gmail.com>
References: <1461835923-68492-1-git-send-email-qiujiang@huawei.com>
	<1461835923-68492-2-git-send-email-qiujiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1461835923-68492-2-git-send-email-qiujiang@huawei.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Jiang Qiu <qiujiang@huawei.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Jamie Iles <jamie@jamieiles.com>, charles.chenxin@huawei.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linuxarm <linuxarm@huawei.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 28, 2016 at 11:32 AM, Jiang Qiu <qiujiang@huawei.com> wrote:

> This patch removed the name property from dwapb_port_property.
> The name property is redundant, since we can get this info
> from dwapb_gpio dev node.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Jiang Qiu <qiujiang@huawei.com>

Hmmm just applied another version. Oh well, applying this
instead.

Yours,
Linus Walleij
