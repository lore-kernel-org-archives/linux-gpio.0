From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 5/7] gpio: 104-idi-48: Implement get_multiple callback
Date: Mon, 26 Mar 2018 10:27:04 +0200
Message-ID: <CACRpkdaarvTewRR6sz0C_3ML5uhHhXR3BazYZXvEFdEJBw8FTw@mail.gmail.com>
References: <cover.1521723192.git.vilhelm.gray@gmail.com> <a91859083599fe06a302eb336858d56ce8e8ea3d.1521723192.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a91859083599fe06a302eb336858d56ce8e8ea3d.1521723192.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 22, 2018 at 2:00 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES I/O 104-IDI-48 series of devices provides 48
> optically-isolated inputs accessed via six 8-bit ports. Since eight
> input lines are acquired on a single port input read, the 104-IDI-48
> GPIO driver may improve multiple input reads by utilizing a get_multiple
> callback. This patch implements the idi_48_gpio_get_multiple function
> which serves as the respective get_multiple callback.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
