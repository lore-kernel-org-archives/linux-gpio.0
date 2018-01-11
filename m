From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: mt7622: align error handling of
 mtk_hw_get_value call
Date: Thu, 11 Jan 2018 10:44:07 +0100
Message-ID: <CACRpkdajTwE-TsVdzXbHcvKOfpHWkmVXQwFPvg=E9yg3SxLX3g@mail.gmail.com>
References: <a26c40a8ad2af3cf81b31ae34bc82c1ef80d9279.1515514758.git.sean.wang@mediatek.com>
 <0eb8fd904f9b49d0e992bc2ee725d057f94cf735.1515514758.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0eb8fd904f9b49d0e992bc2ee725d057f94cf735.1515514758.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 9, 2018 at 5:28 PM,  <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> Make consistent error handling of all mtk_hw_get_value occurrences using
> propagating error code from the internal instead of creating a new one.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
