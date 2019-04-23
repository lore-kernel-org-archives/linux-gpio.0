From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v2 15/79] docs: gpio: convert docs to ReST and rename to
 *.rst
Date: Tue, 23 Apr 2019 09:36:08 -0300
Message-ID: <20190423093608.1af5e0fb@coco.lan>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
        <03cdacc3db76c5ff984c1507ea6434650d36d822.1555938376.git.mchehab+samsung@kernel.org>
        <CACRpkdY=YurusedRbMDWstJUP4CLUosW0rLetvE=Hkov1Y9HGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY=YurusedRbMDWstJUP4CLUosW0rLetvE=Hkov1Y9HGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Em Tue, 23 Apr 2019 13:23:50 +0200
Linus Walleij <linus.walleij@linaro.org> escreveu:

> On Mon, Apr 22, 2019 at 3:28 PM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> 
> > The API described at sysfs.txt is deprecated.
> >
> > Still, as it is still part of the Kernel (and will likely be
> > there for some time, as we don't simply remove APIs). So,
> > it makes sense to keep it there.
> >
> > The conversion of this file is trivial:
> >   - add blank lines and identation in order to identify paragraphs;
> >   - mark a literal block as such.
> >
> > At its new index.rst, let's add a :orphan: while this is not linked to
> > the main index.rst file, in order to avoid build warnings.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Same question as the v1: should I apply it or will you :)

I suspect that it would be better if it gets applied via
the GPIO tree, in order to reduce potential merge conflicts.

Regards,
Mauro
