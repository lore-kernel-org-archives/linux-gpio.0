From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH 0/8] STMPE fixes/rework and add STMPE1600 support
Date: Wed, 20 Apr 2016 16:15:51 +0000
Message-ID: <45e660f1-81ad-4d1f-ba3a-fc042e35961b@email.android.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>,
 <20160419124126.GF8284@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160419124126.GF8284@ulmo.ba.sec>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "gnurou@gmail.com" <gnurou@gmail.com>, "amelie.delaunay@st.com" <amelie.delaunay@st.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "vireshk@kernel.org" <vireshk@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patrice.chotard@st.com" <patrice.chotard@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "shiraz.linux.kernel@gmail.com" <shiraz.linux.kernel@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "maxime.coquelin@st.com" <maxime.coquelin@st.com>
List-Id: linux-gpio@vger.kernel.org


On Apr 19, 2016 14:41, Thierry Reding <thierry.reding@gmail.com> wrote:
>...
> Adding Marcel Ziswiler, who's better suited a

On Tue, Apr 19, 2016 at 02:18:29PM +0200, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
>
> This series cleans and fixes some bugs in MFD/GPIO STMPE drivers and prepare
>  the ground to add new STMPE1600 support.
>
> STMPE1600 datasheet is available here :
> http://www2.st.com/content/st_com/en/products/interfaces-and-transceivers/
> i-o-expanders-and-level-translators/i-o-expanders/stmpe1600.html
>
> Only STMPE1600 has been tested on STM32 platform. As i have no board with
> others STMPE variant(STMPE610/STMPE801/STMPE811/STMPE1601/STMPE1801/STMPE2401
> and STMPE2403), i put in CC boards's maintainers which are using others STMPE variant.
>
> If they can kindly check that no regression has been introduce by this series
> :
>
> For ARM/FREESCALE IMX / MXC ARM ARCHITECTURE:
>       _ Shawn Guo <shawnguo@kernel.org>
>       _ Sascha Hauer <kernel@pengutronix.de>
>
> For ARM/SOCFPGA ARCHITECTURE
>       _ Dinh Nguyen <dinguyen@opensource.altera.com>
>
> For SPEAR PLATFORM SUPPORT
>       _ Viresh Kumar <vireshk@kernel.org>
>       _ Shiraz Hashim <shiraz.linux.kernel@gmail.com>
>
> For TEGRA ARCHITECTURE SUPPORT
>       _ Stephen Warren <swarren@wwwdotorg.org>
>       _ Thierry Reding <thierry.reding@gmail.com>
>       _ Alexandre Courbot <gnurou@gmail.com>

Adding Marcel Ziswiler, who's better suited at judging whether or not
this has any impact on Apalis/Colibri.

Marcel, in case you don't have these in your inbox you can find them on
linux-gpio's patchwork:

        https://patchwork.ozlabs.org/project/linux-gpio/list/

Thierry
