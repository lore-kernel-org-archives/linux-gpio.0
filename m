Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239ACEE4993
	for <linux-gpio@archiver.kernel.org>; Wed, 23 Aug 2023 13:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbjHWNfR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 23 Aug 2023 09:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbjHWNfR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2023 09:35:17 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EDAC8CDF;
        Wed, 23 Aug 2023 06:35:00 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B3361042;
        Wed, 23 Aug 2023 06:35:41 -0700 (PDT)
Received: from pluto (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3CF73F740;
        Wed, 23 Aug 2023 06:34:58 -0700 (PDT)
Date:   Wed, 23 Aug 2023 14:34:55 +0100
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] pinctrl: Implementation of the generic
 scmi-pinctrl driver
Message-ID: <ZOYK_x6yc59pDwzA@pluto>
References: <cover.1691518313.git.oleksii_moisieiev@epam.com>
 <a6cefa60500cd46313ad6cda4f13f4985c0f5237.1691518314.git.oleksii_moisieiev@epam.com>
 <ZOWHWLVtKXwRug+Z@octopus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOWHWLVtKXwRug+Z@octopus>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 23, 2023 at 01:13:12PM +0900, AKASHI Takahiro wrote:
> Hi Oleksii,
> 

Hi AKASHI, Oleksii,

> On Tue, Aug 08, 2023 at 06:25:35PM +0000, Oleksii Moisieiev wrote:
> > scmi-pinctrl driver implements pinctrl driver interface and using
> > SCMI protocol to redirect messages from pinctrl subsystem SDK to
> > SCMI platform firmware, which does the changes in HW.
> > 
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

[snip]

> > +static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev, unsigned int _pin,
> > +				    unsigned long *config)
> > +{
> > +	int ret;
> > +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> > +	enum pin_config_param config_type;
> > +	unsigned long config_value;
> > +
> > +	if (!config)
> > +		return -EINVAL;
> > +
> > +	config_type = pinconf_to_config_param(*config);
> > +
> > +	ret = pinctrl_ops->config_get(pmx->ph, _pin, PIN_TYPE, config_type, &config_value);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*config = pinconf_to_config_packed(config_type, config_value);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
> > +				    unsigned int _pin,
> > +				    unsigned long *configs,
> > +				    unsigned int num_configs)
> > +{
> > +	int i, ret;
> > +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> > +	enum pin_config_param config_type;
> > +	unsigned long config_value;
> > +
> > +	if (!configs || num_configs == 0)
> > +		return -EINVAL;
> > +
> > +	for (i = 0; i < num_configs; i++) {
> > +		config_type = pinconf_to_config_param(configs[i]);
> > +		config_value = pinconf_to_config_argument(configs[i]);
> 
> The generic pinconf parameters defined as "enum pin_config_param"
> do not exactly match with a set of SCMI's configuration types defined
> in Table 23 in the section 4.11.2.6 "PINCTRL_CONFIG_GET".
> pinconf_to_config_param() simply masks the lowest 8 bits of the input
> value, but doesn't convert anything.

Indeed the SCMI Types table and the Linux Pinctrl subsystem types are
similar but not really the same; some kind of conversion/mapping will be
needed.

Some trivial conversion layer will be needed also in order to address
here any of the possible future changes in the Linux pinctrl subsystem
definitions without having to change the SCMI server side
(that typically is fw...and that anyway is bound to the SCMI spec)

Thanks,
Cristian

