From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] Allow pinctrl framework to create links
Date: Thu, 23 May 2019 09:37:22 +0200
Message-ID: <CACRpkdYOS0UrXPtJb0--4RW6QM_Xq8wb=9Gj5X9fk7JWCgpWfQ@mail.gmail.com>
References: <20190522152925.12419-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522152925.12419-1-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Alexandre TORGUE <alexandre.torgue@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi Benjamin!

On Wed, May 22, 2019 at 5:29 PM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:

> Some pin controllers may need to ensure suspend/resume calls ordering between
> themselves and their clients.
> That is the case for STMFX (an I2C GPIO expender) which need to be suspended
> after all it clients to let them call pinctrl_pm_select_sleep_state() before
> perform it own suspend function. It is the same problem for resume but in
> reverse order.
>
> This series allow to let pinctrl core knows if a controller would like to
> create link between itself and it client by setting create_link to true.

I changed the name of the boolt to "link_consumers" and applied!

I will send patches for all other pin controllers that are I2C or other
slow bus based, as they will definately need this. Let's see what
happens!

Yours,
Linus Walleij
