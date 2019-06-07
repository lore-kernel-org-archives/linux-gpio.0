From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 16/22] docs: gpio: driver.rst: fix a bad tag
Date: Fri, 7 Jun 2019 22:57:16 +0200
Message-ID: <CACRpkdYmqGj3PC1firW2awWyi4OuzHwSrYo7n3Ph8j0==824qA@mail.gmail.com>
References: <cover.1559171394.git.mchehab+samsung@kernel.org> <ab694e03ba6de8908d0a19a58408180eee3f795b.1559171394.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ab694e03ba6de8908d0a19a58408180eee3f795b.1559171394.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 30, 2019 at 1:24 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With ReST, [foo]_ means a reference to foo, causing this warning:
>
>     Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".
>
> Fix it by using a literal for the name.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Patch applied to the GPIO tree.

Yours,
Linus Walleij
