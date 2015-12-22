From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Tue, 22 Dec 2015 11:23:26 +0100
Message-ID: <CACRpkdbuL5Kjeqb-zJg9DmoxKzy7vphYgBTG-Ffh2i=UVH97ug@mail.gmail.com>
References: <1450412497-25872-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450412497-25872-1-git-send-email-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Patrice Chotard <patrice.chotard@st.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Dec 18, 2015 at 5:21 AM, Daniel Kurtz <djkurtz@chromium.org> wrote:

> Move pinctrl initialization earlier in boot so that real devices can find
> their pctldev without probe deferring.
>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

I interpret the discussion as I should wait for a new version of this?

Or should it be applied?

Yours,
Linus Walleij
