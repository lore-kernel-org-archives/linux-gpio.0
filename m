From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: merrifield: fix dup size in probe
Date: Wed, 7 Sep 2016 22:00:30 +0200
Message-ID: <CACRpkdZg5xeXg7dFhAqQeYEmKBZ_4Gt32Xcxb5oL6f2obkPA9w@mail.gmail.com>
References: <1466678976-52598-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160831123050.13202-1-vincent.stehle@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160831123050.13202-1-vincent.stehle@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2016 at 2:30 PM, Vincent Stehl=C3=A9
<vincent.stehle@intel.com> wrote:

> In function mrfld_pinctrl_probe(), when duplicating the mrfld_families
> array the requested memory region length is multiplied once too many by t=
he
> number of elements in the original array. Fix this to spare some memory.
>
> Fixes: 4e80c8f505741cbd ("pinctrl: intel: Add Intel Merrifield pin contro=
ller support")
> Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied for fixes with Andy's ACK.

Yours,
Linus Walleij
