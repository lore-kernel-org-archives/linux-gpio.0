From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 RESEND] gpio: arizona: Support Cirrus Logic CS47L24
 and WM1831
Date: Mon, 11 Jan 2016 06:26:39 +0000
Message-ID: <20160111062639.GQ3331@x1>
References: <1449480242-19380-1-git-send-email-rf@opensource.wolfsonmicro.com>
 <1449480242-19380-2-git-send-email-rf@opensource.wolfsonmicro.com>
 <CACRpkdaosbBm4oOGHWUVBV+s9UdQ1oU7cFjd4+c_9uzyab97kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaosbBm4oOGHWUVBV+s9UdQ1oU7cFjd4+c_9uzyab97kg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, 11 Dec 2015, Linus Walleij wrote:

> On Mon, Dec 7, 2015 at 10:24 AM, Richard Fitzgerald
> <rf@opensource.wolfsonmicro.com> wrote:
>=20
> > The CS47L24 and WM1831 codecs only have two GPIO lines, but are
> > otherwise similar to the WM8280.
> >
> > Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> OK I guess it should just be optimistically merged to the MFD
> tree where the dependency is (I guess?). Else I can take it once the =
MFD
> changes are upstream.

I just applied it.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
