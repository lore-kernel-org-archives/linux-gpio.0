From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v2 12/22] docs: gpio: driver.rst: fix a bad tag
Date: Sat, 8 Jun 2019 06:42:08 -0300
Message-ID: <20190608064208.12e0e145@coco.lan>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
        <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
        <CACRpkdayQdrtqO3aygY1uDG0LCX_9rVnSnxP5F_C-KMZURTAYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdayQdrtqO3aygY1uDG0LCX_9rVnSnxP5F_C-KMZURTAYA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Em Sat, 8 Jun 2019 00:08:10 +0200
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Tue, Jun 4, 2019 at 4:18 PM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> 
> > With ReST, [foo]_ means a reference to foo, causing this warning:
> >
> >     Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".
> >
> > Fix it by using a literal for the name.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Looks identical to the v1 I already applied, so keeping
> that one.

Thanks for applying it.

Yeah, it should be identical (and so it should be the v3 I sent yesterday).

v2 and v3 are just rebases on the top of linux-next.

Thanks,
Mauro
