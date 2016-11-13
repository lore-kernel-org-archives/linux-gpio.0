From: =?UTF-8?B?6ZmI6LGq?= <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: add the sdmmc pinctrl for rk1108
Date: Sun, 13 Nov 2016 16:18:02 +0800
Message-ID: <CAFLEztQNnjXeSf3qc=j3WVu4PWBoTs8-gB3oVXtVbauQaxst8Q@mail.gmail.com>
References: <1479024799-29198-1-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1479024799-29198-1-git-send-email-jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

2016-11-13 16:13 GMT+08:00 Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>:
> From: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> Signed-off-by: Jacob Chen <jacob2.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk1108.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> index 9dccfea..6a06ad7 100644
> --- a/arch/arm/boot/dts/rk1108.dtsi
> +++ b/arch/arm/boot/dts/rk1108.dtsi
> @@ -321,6 +321,31 @@
>                         input-enable;
>                 };
>
> +        sdmmc {
> +                       sdmmc_clk: sdmmc-clk {
> +                               rockchip,pins = <3 RK_PC4 RK_FUNC_1 &pcfg_pull_none_drv_4ma>;
> +                       };
> +
> +                       sdmmc_cmd: sdmmc-cmd {
> +                               rockchip,pins = <3 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
> +                       };
> +
> +                       sdmmc_cd: sdmmc-cd {
> +                               rockchip,pins = <0 RK_PA1 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
> +                       };
> +
> +                       sdmmc_bus1: sdmmc-bus1 {
> +                               rockchip,pins = <3 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
> +                       };
> +
> +                       sdmmc_bus4: sdmmc-bus4 {
> +                               rockchip,pins = <3 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_4ma>,
> +                                               <3 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_4ma>,
> +                                               <3 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_4ma>,
> +                                               <3 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
> +                       };
> +               };
> +
>                 i2c1 {
>                         i2c1_xfer: i2c1-xfer {
>                                 rockchip,pins = <2 RK_PD3 RK_FUNC_1 &pcfg_pull_up>,
> --
> 2.7.4
>

Those patches are based on andy's patch set "Add basic support for
support for Rockchip RK1108 SOC ", assuming he will include
drive-strength functionality in pinctrl.
