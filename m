From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] gpio: only enable kona driver on BCM_MOBILE or for
 compile testing
Date: Wed, 24 Sep 2014 10:06:25 +0200
Message-ID: <20140924080625.GE3755@pengutronix.de>
References: <1392990146-18916-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkdZg5uoP5LurL5vOPCaKQu2B=neybuo=gwM_JT7UAhRkjg@mail.gmail.com>
 <530FB808.5050802@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <530FB808.5050802@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, kernel@pengutronix.de, Markus Mayer <mmayer@broadcom.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 27, 2014 at 02:11:20PM -0800, Markus Mayer wrote:
> On 14-02-27 01:16 AM, Linus Walleij wrote:
> >On Fri, Feb 21, 2014 at 2:42 PM, Uwe Kleine-K=F6nig
> ><u.kleine-koenig@pengutronix.de> wrote:
> >
> >>This change makes it easier to configure a kernel for a real machine by
> >>not showing the option to enable it at all if COMPILE_TEST is off.
> >>
> >>Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >
> >Markus: can you ACK this patch?
> =

> Acked-by: Markus Mayer <mmayer@broadcom.com>
ping!

Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
