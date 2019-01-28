From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl.txt: Remove outdated information
Date: Mon, 28 Jan 2019 10:08:26 +0100
Message-ID: <CACRpkdbgq-FdsBghLMgSpPWX0LrEBL4bhSXRh24E1oaQ1OdjiA@mail.gmail.com>
References: <20190121143822.20225-1-ramon.fried@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121143822.20225-1-ramon.fried@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ramon Fried <ramon.fried@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 21, 2019 at 3:38 PM Ramon Fried <ramon.fried@linux.intel.com> wrote:

> Returning -EAGAIN is no longer supported by pin_config_group_set()
> since ad42fc6c8479 ("pinctrl: rip out the direct pinconf API")
>
> Remove the relevant section from the documentation.
>
> Signed-off-by: Ramon Fried <ramon.fried@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
