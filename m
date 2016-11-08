From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: st: st_pctl_dt_parse_groups simplify expression
Date: Tue, 8 Nov 2016 11:27:41 +0100
Message-ID: <CACRpkdaDV4FjOtUoSwCAmbOnQqn8NZZ_nD2tpRoVoSPVePtKyw@mail.gmail.com>
References: <20161105143515.4668-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161105143515.4668-1-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Patrice Chotard <patrice.chotard@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 5, 2016 at 3:35 PM, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> for_each_property_of_node(pins, pp) checks that pp is not NULL.
> So there is no need to check it inside the loop.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Patch applied with Patrice's ACK.

Yours,
Linus Walleij
