From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: modify NPCM7xx pin configuration function
Date: Thu, 15 Nov 2018 11:15:31 +0100
Message-ID: <CACRpkdYo_4Be=N-ewRBMCP=KAs4DeXW4r-qQerx2UAvsyS=-fQ@mail.gmail.com>
References: <20181107134434.354795-1-tmaimon77@gmail.com> <20181107134434.354795-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107134434.354795-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, benjaminfair@google.com, Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, Joel Stanley <joel@jms.id.au>, Kun Yi <kunyi@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 7, 2018 at 2:44 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Modify GPIO direction setting in pin configuration function by using
> generic GPIO functions to set the GPIO direction instead of direct
> access to the GPIO direction register.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Patch applied with Kun Yi's tested-by tag!

Yours,
Linus Walleij
