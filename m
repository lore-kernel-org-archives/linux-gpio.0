From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: Delete an error message for a failed memory
 allocation in msm_pinctrl_probe()
Date: Thu, 28 Dec 2017 13:41:43 +0100
Message-ID: <CACRpkdZ29c7GVMzOc_cVjwegbifWkqWhh7HQzCtzf-iGy564TA@mail.gmail.com>
References: <0d5eae19-c8f9-3280-e68e-419646535512@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <0d5eae19-c8f9-3280-e68e-419646535512@users.sourceforge.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 27, 2017 at 10:10 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 27 Dec 2017 22:04:22 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
