From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mockup: fix debugfs read
Date: Thu, 28 Mar 2019 17:55:55 +0100
Message-ID: <CACRpkdZvc2iMZO+9ACFWiyy496huu5R0A=d6OOD8C71kAD1C5g@mail.gmail.com>
References: <20190322173052.23763-1-brgl@bgdev.pl> <CACRpkdbw7zvYx1s742HmYj8E=J0=SygEgBHVDyQ5c84N70V3fA@mail.gmail.com>
 <CAMRc=Mfd=cj7TcMOeaSJaAG_kfs8tg2UMGUR6iTwNhT3+q3n6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mfd=cj7TcMOeaSJaAG_kfs8tg2UMGUR6iTwNhT3+q3n6A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 28, 2019 at 5:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> czw., 28 mar 2019 o 17:38 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
> > On Fri, Mar 22, 2019 at 6:30 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > The debugfs read callback must advance ppos or users using read() on
> > > the file descriptor will never get the EOL. This wasn't spotted befor=
e
> > > as I was using busybox cat for testing which uses sendfile() internal=
ly
> > > and only noticed it now when switched to cat from coreutils.
> > >
> > > Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Patch applied for fixes.
> > Sorry for slow application, I was in no-wifi-land for some days.
> >
> > Yours,
> > Linus Walleij
>
> Ugh, I was thinking about sending you a pull-request with this and a
> subsequent fix this evening. Plus other fixes I have in my tree.

Oh if it is easier for you do that, and I will drop this patch and just
merge your PR as it arrives.

Yours,
Linus Walleij
