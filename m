From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: st: st_pinconf_dbg_show wrong format string
Date: Tue, 8 Nov 2016 11:26:32 +0100
Message-ID: <CACRpkdb1OoFxYNwU9Zm=AcQuWNmogM0HsoiiWi=VNj-3HrCF1A@mail.gmail.com>
References: <20161105142515.4377-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161105142515.4377-1-xypron.glpk@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Patrice Chotard <patrice.chotard@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 5, 2016 at 3:25 PM, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:

> function is defined as unsigned int.
> So we need %u to print it.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Patch applied with Patrice's ACK.

Yours,
Linus Walleij
