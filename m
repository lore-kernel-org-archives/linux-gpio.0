From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 12/22] docs: gpio: driver.rst: fix a bad tag
Date: Sat, 8 Jun 2019 00:08:10 +0200
Message-ID: <CACRpkdayQdrtqO3aygY1uDG0LCX_9rVnSnxP5F_C-KMZURTAYA@mail.gmail.com>
References: <cover.1559656538.git.mchehab+samsung@kernel.org> <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 4:18 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:

> With ReST, [foo]_ means a reference to foo, causing this warning:
>
>     Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".
>
> Fix it by using a literal for the name.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Looks identical to the v1 I already applied, so keeping
that one.

Yours,
Linus Walleij
