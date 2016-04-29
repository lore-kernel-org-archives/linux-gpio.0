From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/10] STMPE fixes/rework and add STMPE1600 support
Date: Fri, 29 Apr 2016 09:45:38 +0200
Message-ID: <CACRpkdYyVBRRrVJhGq_UdWxO2RU3s55nQ4shKyw_t21673a-oQ@mail.gmail.com>
References: <1461845589-4826-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461845589-4826-1-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, dev@lynxeye.de
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 28, 2016 at 2:12 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> This series cleans and fixes some bugs in MFD/GPIO STMPE drivers and prepare
>  the ground to add new STMPE1600 support.

This series is finished and looking good from a GPIO perspective.

Lee, once you feel satisfied with the patches and merge them
I'd need an immutable branch, this one I definately have to pull
into the GPIO tree (because of dependent patches).

Yours,
Linus Walleij
