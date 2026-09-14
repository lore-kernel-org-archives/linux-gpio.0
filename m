Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022090.outbound.protection.outlook.com [40.107.75.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCC2D73A0;
	Mon, 14 Sep 2026 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789352524; cv=fail; b=jHenOMicC/ctE/FkUVVpbX2OVp1irnf1/uhfJfm6sp8dJ7i1PbfB2DDIuylobopV0+YF9SWHanKmazE0fs6txH60u2HCvtwM4V7ygVgarNN0cCP+yqy99Z1CRLN7vo3tYDYqxkhpuGJLq3RB2hA2Z7e5o2hSZ9LAEqX+OqOPwFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789352524; c=relaxed/simple;
	bh=shuJ44nN2TbhdkiogL8b2ljF5OSU8hK+kig6w1pjg4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqYyDfiXJm04LO6T3AW1VX70W5hH0AA+juJSyBf5aUJpOa2lEuL/oq/LVlIt6fH8WeuFHHSspCx3uQHdzSsfPmnzsOg4YzaTpe9mT6j/jw/iZ3wHpkCH/HBjDAT9K3lkz4qxVWRGzudX+b++0QNS2ksn+X2XJj8H2BRl+WDHRlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2fAuA5nFwsL/ms606WSMHYPGwe2Jo1bAW0OzmLFFeEevxdH0uPPC/qGtzOl1SkaDlKISO/oOe/m24F5yfij7KMD8gw4l2oIrM4BZI1xKsnRELgUOPUYdaLXR0avOCGaVWAKr+epSVocNO6K7iVCeokSjsaiqz2Qa1obeX+Z5SXMYhwIgr4Kr9lQSeR2stig8Wv2OcpBx50jH3fnr0oVaVppfgFtmYoelz/HHQXk55y4Q2BTa7PobKHLpjviAv/AynWXdeGAMqc6sqPiGC0ewZg9LkorgN9DQOJ+pq7fipRO7o7qTEvPpSTMHadwl6eU8d53W/Uzd28I2HeLxItfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tEjgAAbHV/rvWkki0Kg0WXaYwrNIughZ7yXhBTXOcY=;
 b=NOUhGfUNcuXZdRyjRe2T14EVyuvupn8+xuYTO+i+vcLQFj8v6x+e5X6Eycwh5Bgm9DCWhrpdi08EcbSpw8UCgANnYfOKptcIY9UoDwS6TX9cE6799Dvsx0haIt6tuBORsbej0le4pbjpSXJnktuFk/bAAaDxTdxVV3UhUR4RFlM8NUDsOBLfxYv3xEyMepwlCHEOAYV20APl0STRl2zwjcsgTyzhEaDMpu1+T1Gs9cMHn0WBsx7u8cLT50tWaFDXjk2inWi8a890bSuXpVR7kWneKu0bankhJTklxH+rkTZq/MDRbFWRCdcwc/3r8u+S3Vtwql7AZwBS31kdXlsOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=amd.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0124.apcprd02.prod.outlook.com (2603:1096:4:188::9) by
 TYNPR06MB8997.apcprd06.prod.outlook.com (2603:1096:405:3c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:21:56 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::2b) by SG2PR02CA0124.outlook.office365.com
 (2603:1096:4:188::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 02:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 02:21:56 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B5031427F209;
	Mon, 14 Sep 2026 10:21:55 +0800 (CST)
Date: Mon, 14 Sep 2026 10:21:54 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the
 example
Message-ID: <aqdaQgd2zD7p5GDU@gary-System-Product-Name>
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|TYNPR06MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba692ce-7cbb-437c-4565-08df1206f2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aWkdQLddGLsxkMstMEUMdsyDfguVp4YV/4ik0FSJS9fiVZE0JS/94ZLu+1Bzj3OI0ZS66oWOgZ2TH5XYPjVvK+8m5rmniOM0ZjL+kna9wC8V/qeUPZXpuFvRphGzFGMwSAtvCdu1MTY6D+0zHgCqsrc5aZAxO/8ksnQgaQs4p/WLkpbEWqLFqtGheEp4oitKI8fy0VGDaFmdGq+MeDNpmrFH46rTfnkQr2hemBMaKgoVIHwXxgKqt8UrRE/AlnGpMOeL0we2rlrEZ99IsBBIq5FMA/pxhOrBh9Wi6n9j4zKR0X3XkaD8pTtb3XjhLZIQjzBgrbbfvyLTZC9Qj/49cn+bW09wj8MmPSC1kXXnJM/U0QQGffwtq7hePeXboZ9o9s3gpr8/pGCowrCTKjgRt6/ep8Q6nJ94EwppGQ7brvCVwiG4H6i+Nuq9LnNoQi5xClXWdZ+xwu3NagjGjiB+N/98rhnIbDDB2/8Vv6TascRfKawtJb2Vj+MslnBtl9fUzsQwlyTnusKJGkcY23CrmxH4qD62UlGSJ/MmSru0hGlWbultUdmOfNM4hxC1DfeuTLOIBI9FnJ5KYJZMajBNL+ggkBgEkQ5Hx1fbhlQaRSbfK7Qt0GWIzky5k9IFdsdXFp8MOJSPNgJDumznryVNoNPudl31FsPs18hErSsYV11DOTTvp4hqMCWhdwMLn8NUfPsxoZbbZZ07QtI3VNKj+g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F/79DqLaazRwUbD86GoJJ7cC8g4ftG4fKHYIMyvQWnpFbvcZ1Dpjzu46frkHE6frKlGOX9itotiyrcWeuRWeqmn4BH+Kd8If6rw5QeTkrQ9wBMrPrr6k4JFy4xEqA31EeAcBc9wdknEVjibm7FGI2RgBJLfPGFSCc+IJN1+QcrQalV9+zu8we7zcFruF54tXn1umPiy0uwiZT/2NONNYiy0rmYgtBB+0XrldmXS0qkSGWmauPVM4CsL5y9VrMy0wHvF/2/0qjNEXGGmGkEcZIIh6T1aaJZ2oaWYf3Xkh4fKummeAyYC5uVSKMVT7KvstKQm65CF6KNreG+oIj/ibI+cthHLVhoITOJ9jkMvntYI+zLTSj3XQsyIUtSo64dFu8vMzlm6jdLVF2yfGckDPRLhfzeHMxwA7/4klbCQEPyDEQGNtantIJ5teSe9rEGOh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:21:56.3984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba692ce-7cbb-437c-4565-08df1206f2fe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8997

On 2026-09-13 14:32, Krzysztof Kozlowski wrote:

> EXTERNAL EMAIL
> 
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

For the cix part:

Reviewed-by: Gary Yang <gary.yang@cixtech.com>

> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 50 +++++++++----------
>  .../bindings/pinctrl/cix,sky1-pinctrl.yaml    |  2 +-
>  .../bindings/pinctrl/fsl,imx7d-pinctrl.yaml   |  8 +--
>  .../bindings/pinctrl/intel,lgm-io.yaml        | 14 +++---
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 +-
>  .../pinctrl/mediatek,mt8195-pinctrl.yaml      |  2 +-
>  .../bindings/pinctrl/qcom,hawi-tlmm.yaml      |  4 +-
>  .../bindings/pinctrl/qcom,kaanapali-tlmm.yaml |  4 +-
>  .../bindings/pinctrl/qcom,maili-tlmm.yaml     |  4 +-
>  .../bindings/pinctrl/semtech,sx1501q.yaml     |  4 +-
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 46 ++++++++---------
>  11 files changed, 71 insertions(+), 71 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> index 98c310a3c63c..1c09c0fd4930 100644
> --- a/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> @@ -108,32 +108,32 @@ examples:
>          #size-cells = <0>;
> 
>          aw9523: gpio-expander@58 {
> -                compatible = "awinic,aw9523-pinctrl";
> -                reg = <0x58>;
> -                interrupt-parent = <&tlmm>;
> -                interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
> -                gpio-controller;
> -                #gpio-cells = <2>;
> -                gpio-ranges = <&tlmm 0 0 16>;
> -                interrupt-controller;
> -                #interrupt-cells = <2>;
> -                reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> +            compatible = "awinic,aw9523-pinctrl";
> +            reg = <0x58>;
> +            interrupt-parent = <&tlmm>;
> +            interrupts = <50 IRQ_TYPE_EDGE_FALLING>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges = <&tlmm 0 0 16>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            reset-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> 
> -                keyboard-matrix-col-pins {
> -                        pins = "gpio8", "gpio9", "gpio10", "gpio11",
> -                               "gpio12", "gpio13", "gpio14", "gpio15";
> -                        function = "gpio";
> -                        input-disable;
> -                        output-low;
> -                };
> +            keyboard-matrix-col-pins {
> +                pins = "gpio8", "gpio9", "gpio10", "gpio11",
> +                       "gpio12", "gpio13", "gpio14", "gpio15";
> +                function = "gpio";
> +                input-disable;
> +                output-low;
> +            };
> 
> -                keyboard-matrix-row-pins {
> -                        pins = "gpio0", "gpio1", "gpio2", "gpio3",
> -                               "gpio4", "gpio5", "gpio6", "gpio7";
> -                        function = "gpio";
> -                        bias-pull-up;
> -                        drive-open-drain;
> -                        input-enable;
> -                };
> +            keyboard-matrix-row-pins {
> +                pins = "gpio0", "gpio1", "gpio2", "gpio3",
> +                       "gpio4", "gpio5", "gpio6", "gpio7";
> +                function = "gpio";
> +                bias-pull-up;
> +                drive-open-drain;
> +                input-enable;
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> index 8ed53496c386..4ab1f00775cc 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml
> @@ -86,6 +86,6 @@ examples:
>                  pinmux = <CIX_PAD_GPIO012_FUNC_GPIO012>;
>                  bias-pull-up;
>                  drive-strength = <8>;
> -           };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
> index 948160cfbc5f..7275215918bb 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml
> @@ -106,8 +106,8 @@ examples:
>        fsl,input-sel = <&iomuxc>;
> 
>        pinctrl_gpio_lpsr: gpio1-grp {
> -          fsl,pins =
> -            <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
> -            <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
> -        };
> +        fsl,pins =
> +          <0x0008 0x0038 0x0000 0x0 0x0 0x59>,
> +          <0x000C 0x003C 0x0000 0x0 0x0 0x59>;
> +      };
>      };
> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> index 1144ca2896e3..96c405711f65 100644
> --- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
> @@ -64,13 +64,13 @@ examples:
>          reg = <0xe2880000 0x100000>;
> 
>          uart0-pins {
> -             pins = <64>, /* UART_RX0 */
> -                    <65>; /* UART_TX0 */
> -             function = "CONSOLE_UART0";
> -             pinmux = <1>,
> -                      <1>;
> -             groups = "CONSOLE_UART0";
> -          };
> +            pins = <64>, /* UART_RX0 */
> +                   <65>; /* UART_TX0 */
> +            function = "CONSOLE_UART0";
> +            pinmux = <1>,
> +                     <1>;
> +            groups = "CONSOLE_UART0";
> +        };
>      };
> 
>  ...
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> index 3db2438fadc7..4bcee7741fcd 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> @@ -221,8 +221,8 @@ examples:
> 
>              i2c0_pins_a: i2c0-pins {
>                  pins1 {
> -                  pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
> -                           <PINMUX_GPIO49__FUNC_SDA5>;
> +                    pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
> +                             <PINMUX_GPIO49__FUNC_SDA5>;
>                      mediatek,pull-up-adv = <3>;
>                      drive-strength-microamp = <1000>;
>                  };
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
> index 33cb71775db9..0bcafa78acb2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.yaml
> @@ -234,7 +234,7 @@ examples:
>    - |
>      #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -    #
> +
>      pio: pinctrl@10005000 {
>        compatible = "mediatek,mt8195-pinctrl";
>        reg = <0x10005000 0x1000>,
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
> index 3b3961789860..2b1354e212e5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,hawi-tlmm.yaml
> @@ -113,8 +113,8 @@ examples:
>          #interrupt-cells = <2>;
> 
>          qup-uart7-state {
> -          pins = "gpio62", "gpio63";
> -          function = "qup1_se7";
> +            pins = "gpio62", "gpio63";
> +            function = "qup1_se7";
>          };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
> index 53534a07a1f0..ea7d4768483d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
> @@ -120,8 +120,8 @@ examples:
>          #interrupt-cells = <2>;
> 
>          qup-uart7-state {
> -          pins = "gpio62", "gpio63";
> -          function = "qup1_se7";
> +            pins = "gpio62", "gpio63";
> +            function = "qup1_se7";
>          };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
> index 64fe90b2391b..a0b56adb3388 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
> @@ -113,8 +113,8 @@ examples:
>          #interrupt-cells = <2>;
> 
>          qup-uart7-state {
> -          pins = "gpio62", "gpio63";
> -          function = "qup1_se7";
> +            pins = "gpio62", "gpio63";
> +            function = "qup1_se7";
>          };
>      };
>  ...
> diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> index 39d7dad3313b..f7a7551d7f50 100644
> --- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> @@ -244,8 +244,8 @@ examples:
>              interrupt-controller;
> 
>              gpio1-cfg {
> -                  pins = "gpio1";
> -                  bias-pull-up;
> +                pins = "gpio1";
> +                bias-pull-up;
>              };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> index ce66fd15ff9c..300d38f87f2d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
> @@ -317,37 +317,37 @@ examples:
>      #include <dt-bindings/pinctrl/pinctrl-zynqmp.h>
>      zynqmp_firmware: zynqmp-firmware {
>          pinctrl0: pinctrl {
> -          compatible = "xlnx,zynqmp-pinctrl";
> +            compatible = "xlnx,zynqmp-pinctrl";
> 
> -          pinctrl_uart1_default: uart1-default {
> -             mux {
> -                 groups = "uart0_4_grp", "uart0_5_grp";
> -                 function = "uart0";
> -             };
> +            pinctrl_uart1_default: uart1-default {
> +                mux {
> +                    groups = "uart0_4_grp", "uart0_5_grp";
> +                    function = "uart0";
> +                };
> 
> -             conf {
> -                groups = "uart0_4_grp";
> -                slew-rate = <SLEW_RATE_SLOW>;
> -                power-source = <IO_STANDARD_LVCMOS18>;
> -             };
> +                conf {
> +                    groups = "uart0_4_grp";
> +                    slew-rate = <SLEW_RATE_SLOW>;
> +                    power-source = <IO_STANDARD_LVCMOS18>;
> +                };
> 
> -             conf-rx {
> -                pins = "MIO18";
> -                bias-pull-up;
> -             };
> +                conf-rx {
> +                    pins = "MIO18";
> +                    bias-pull-up;
> +                };
> 
> -             conf-tx {
> -                pins = "MIO19";
> -                bias-disable;
> -                input-schmitt-disable;
> -             };
> -          };
> +                conf-tx {
> +                    pins = "MIO19";
> +                    bias-disable;
> +                    input-schmitt-disable;
> +                };
> +            };
>          };
>      };
> 
>      uart1 {
> -         pinctrl-names = "default";
> -         pinctrl-0 = <&pinctrl_uart1_default>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_uart1_default>;
>      };
> 
>  ...
> --
> 2.53.0
> 
