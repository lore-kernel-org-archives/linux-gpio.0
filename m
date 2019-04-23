From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 15/57] docs: gpio: convert it to ReST
Date: Tue, 23 Apr 2019 09:38:22 -0300
Message-ID: <20190423093822.52227129@coco.lan>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
        <0f2d522a80f96391d3f7b51389d08b4afaedb618.1555382110.git.mchehab+samsung@kernel.org>
        <CACRpkdYQeEoyE9sAAo2KZjurx9sH4w+bzM-_-_h6U4w7PeX7eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYQeEoyE9sAAo2KZjurx9sH4w+bzM-_-_h6U4w7PeX7eg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Em Tue, 23 Apr 2019 12:52:04 +0200
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Tue, Apr 16, 2019 at 4:56 AM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> 
> > The API described at sysfs.txt is deprecated.
> >
> > Still, as it is still part of the Kernel (and will likely be
> > there for some time, as we don't simply remove APIs). So,
> > it makes sense to keep it there.
> >
> > The conversion of this file is trivial.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Mauro will you merge this or do you want me to merge it?

Linus,

Just answered on the other e-mail: better to merge via your
tree. Just notice that this version was superseded by

 [PATCH v2 15/79] docs: gpio: convert docs to ReST and rename to *.rst

As it also does the rename to .rst.

Thanks,
Mauro
