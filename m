From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH net-next v2 1/1] net: stmmac: use GPIO descriptors in
 stmmac_mdio_reset
Date: Sat, 15 Jun 2019 11:34:25 +0200
Message-ID: <CACRpkdbQ5VivFJhL4keOgmUe7BzhVU2v2R0Lso8rQx5s3tHY8w@mail.gmail.com>
References: <20190612193115.6751-1-martin.blumenstingl@googlemail.com>
 <20190612193115.6751-2-martin.blumenstingl@googlemail.com>
 <CACRpkdajXRXRFz=XpbEzwUb-crhBxNQ4f-m9rfdY6+HcG0+_gA@mail.gmail.com>
 <CAFBinCAimhth8fDcBZ3vNdy_9dGmHZVAAK0=TUczWWC4Dsa-pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCAimhth8fDcBZ3vNdy_9dGmHZVAAK0=TUczWWC4Dsa-pA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Jose Abreu <joabreu@synopsys.com>, Giuseppe CAVALLARO <peppe.cavallaro@st.com>, "David S. Miller" <davem@davemloft.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jun 15, 2019 at 11:11 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> I think I finally understand why you want to switch everything over to
> GPIO descriptors

A bit after-the-fact reasoning, but after I was made aware of an interesting
lecture by John Ousterhout I feel the best description of the descriptor
refactoring is the idea to make the GPIO API narrow and deep, make
it simple for consumers (hence <linux/gpio/consumer.h>) and handle
as much special cases (polarity inversion, open drain...) as possible
behind the scenes.

Yours,
Linus Walleij
