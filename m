From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V3 0/2] pinctrl: imx: add imx8qxp pinctrl support
Date: Tue, 30 Oct 2018 13:01:32 +0100
Message-ID: <CACRpkdaYD9S4n0__=Ff8-U3Ze1RFDQHNK3t62Yo8TOhqVdcj5Q@mail.gmail.com>
References: <1539756011-32559-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1539756011-32559-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Dong Aisheng <dongas86@gmail.com>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 17, 2018 at 8:04 AM A.s. Dong <aisheng.dong@nxp.com> wrote:

> This patch series adds i.MX8QXP pinctrl support which is based on
> the pad service provided by SCU firmware.
>
> Note it depends on SCU APIs patch set which has already been merged by Shawn.
> So suppose this patch series can go through shawn's tree.
>
> Note the binding part is also merged into scu binding doc according to
> Rob's suggestion.
> https://www.spinics.net/lists/arm-kernel/msg680738.html
>
> v2->v3:
>  * Pad name update (add IMX8QXP prefix)

I wanted to apply this series for v4.21 but it doesn't work. The patches
look very weird, I think because of the Exchange server you are using
to send them. It contains things like this:

ontent-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id:
5ed53ba8-dd6f-4c85-7264-08d633f66fd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 06:04:45.7080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4179

Can you double-check and resend?

Yours,
Linus Walleij
