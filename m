Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABA463B8F;
	Fri, 16 Oct 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141682; cv=none; b=CqN3CRRzZiR3D1prd4egLc/UlY1DSDUjYPmP/OmsjtpP40hht8rNY8zDvTL3SNuKwP1eRADjA/08/B0xEQmNRJFw5TRDP/uV2C+DovteRG3cSaEmggNKlOzbvnGNgqJ4ijkYGW1v8PCnPRYJqfnRDhJBttte8vpYyxFRliv2c8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141682; c=relaxed/simple;
	bh=0H+gvnNjd7wlwfeeqkdpgShi15TQoY3FiD/J02xQ/fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuNx3MvV+k4VJhBKzQr3O6K56loV9qk47S1WpYqutAAVTHt8Do7LpiC836ODSXzZ2VxNv9ic+POPrO8rqnMpFnn8OdUiRX7AsNbX/4g/F39td1eETiMmNANbbH6VzIou90VAGb0bD7PLsdrjwdk+KZNFnBNNZpOvZ8fTuTPojmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fpJ6wl3X; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y6Ru1n7b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fpJ6wl3X";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y6Ru1n7b"
Date: Fri, 16 Oct 2026 11:07:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792141677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxCP9S1/pf1Cm42vOzUrsyqMN5G6h6G6M+H7C2dDlRk=;
	b=fpJ6wl3XA8tKlt2IlfKHDUiYLll445Wo+RvN1hcvcd7v/174t5ZaH7cOQQCh6A9RzsEKXT
	yXGXBtrfzYq7XBscFi0HigCtl99UOdAveYpFEKVMSAj8lDSgbBf8c6fwEPW+Hz/selQ3WI
	50N5JpnnjbnpDecRykWKOQvyraFmV13p2SCM/jHEF+jofphYaPZ9yOB1hSjB5z0bBcuRfU
	euffqXpwGbD3fz2kvwnNxrdNRXgESEo9GZO9+kRlzfBBFatNYHA6GRDsI1IvIbfsXwcCwD
	JgctqY0wyxT4vnx+SAUddSzh3Xbc4jXKA+ox+jGIHwLuHRUj+/QXSWgDxQuYLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792141677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rxCP9S1/pf1Cm42vOzUrsyqMN5G6h6G6M+H7C2dDlRk=;
	b=y6Ru1n7boXExe48y2684BS01GqAmPEeps+YDkZrr81BI2iwiBRcBeH/nhs5sJxButV0fDR
	UccxuWBEndWeBNCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] gpio: sim: access sysfs attributes as const
Message-ID: <20261016105712-707634de-c955-4c66-957a-2bdb84bca3e4@linutronix.de>
References: <20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com>

Hi Bartosz!

On Fri, Oct 16, 2026 at 10:13:50AM +0200, Bartosz Golaszewski wrote:
> Use the const variant of constainer_of() to access struct
> gpio_sim_attribute which wraps the dynamically allocated sysfs
> attributes for value and pull of simulated GPIO lines in line with the
> currently preferred approach.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Following your talk, I'm sending a patch for the GPIO simulator module
> that attempts to constify the sysfs attributes. Please tell me if this
> is all I need here as the attributes are part of another struct that's
> allocated dynamically. I'm not sure if there's anything more to do here.
> ---
>  drivers/gpio/gpio-sim.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 0c73bec042670fc5706b4a93700e652cbaf3605e..e0ae586cd08d8adbb3c16918607074fce116654e 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -59,10 +59,10 @@ struct gpio_sim_attribute {
>  	unsigned int offset;
>  };
>  
> -static struct gpio_sim_attribute *
> +static const struct gpio_sim_attribute *
>  to_gpio_sim_attr(struct device_attribute *dev_attr)
>  {
> -	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
> +	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr);
>  }
>  
>  static int gpio_sim_apply_pull(struct gpio_sim_chip *chip,
> @@ -272,7 +272,7 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
>  static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
>  				       struct device_attribute *attr, char *buf)
>  {
> -	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> +	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
>  	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
>  	int val;
>  
> @@ -302,7 +302,7 @@ static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
>  {
> -	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> +	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
>  	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
>  	int pull;
>  
> @@ -316,7 +316,7 @@ static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
>  					 struct device_attribute *attr,
>  					 const char *buf, size_t len)
>  {
> -	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> +	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
>  	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
>  	int ret, pull;

You should also use the _const APIs for the dynamically allocated attributes.
While does not improve security here, it makes it clearer that the callbacks
are not supposed to change these structures and will allow us to remove the
non-const variants later. See below:

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index e0ae586cd08d..34b45d0d3575 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -60,7 +60,7 @@ struct gpio_sim_attribute {
 };
 
 static const struct gpio_sim_attribute *
-to_gpio_sim_attr(struct device_attribute *dev_attr)
+to_gpio_sim_attr(const struct device_attribute *dev_attr)
 {
 	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr);
 }
@@ -270,7 +270,7 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 }
 
 static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
-				       struct device_attribute *attr, char *buf)
+				       const struct device_attribute *attr, char *buf)
 {
 	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
@@ -283,7 +283,7 @@ static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
 }
 
 static ssize_t gpio_sim_sysfs_val_store(struct device *dev,
-					struct device_attribute *attr,
+					const struct device_attribute *attr,
 					const char *buf, size_t count)
 {
 	/*
@@ -299,7 +299,7 @@ static const char *const gpio_sim_sysfs_pull_strings[] = {
 };
 
 static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
-					struct device_attribute *attr,
+					const struct device_attribute *attr,
 					char *buf)
 {
 	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
@@ -313,7 +313,7 @@ static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
 }
 
 static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
-					 struct device_attribute *attr,
+					 const struct device_attribute *attr,
 					 const char *buf, size_t len)
 {
 	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
@@ -361,7 +361,7 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 	unsigned int num_lines = chip->gc.ngpio;
 	struct device *dev = chip->gc.parent;
 	struct attribute_group *attr_group;
-	struct attribute **attrs;
+	const struct attribute **attrs;
 	int i, ret;
 
 	chip->attr_groups = devm_kcalloc(dev, sizeof(*chip->attr_groups),
@@ -396,15 +396,15 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 
 		val_dev_attr->attr.mode = pull_dev_attr->attr.mode = 0644;
 
-		val_dev_attr->show = gpio_sim_sysfs_val_show;
-		val_dev_attr->store = gpio_sim_sysfs_val_store;
-		pull_dev_attr->show = gpio_sim_sysfs_pull_show;
-		pull_dev_attr->store = gpio_sim_sysfs_pull_store;
+		val_dev_attr->show_const = gpio_sim_sysfs_val_show;
+		val_dev_attr->store_const = gpio_sim_sysfs_val_store;
+		pull_dev_attr->show_const = gpio_sim_sysfs_pull_show;
+		pull_dev_attr->store_const = gpio_sim_sysfs_pull_store;
 
 		attrs[0] = &val_dev_attr->attr;
 		attrs[1] = &pull_dev_attr->attr;
 
-		attr_group->attrs = attrs;
+		attr_group->attrs_const = attrs;
 		chip->attr_groups[i] = attr_group;
 	}


As you are touching this file anyways, you could also prepare it for the
constification of configfs attributes. See the example below, the same for the
other instances in the file. The necessary infrastructure will be part of the
next merge window.

@@ -1505,7 +1505,7 @@ static const struct configfs_group_operations gpio_sim_bank_config_group_ops = {
 static const struct config_item_type gpio_sim_bank_config_group_type = {
        .ct_item_ops    = &gpio_sim_bank_config_item_ops,
        .ct_group_ops   = &gpio_sim_bank_config_group_ops,
-       .ct_attrs       = gpio_sim_bank_config_attrs,
+       .ct_attrs_const = gpio_sim_bank_config_attrs,
        .ct_owner       = THIS_MODULE,
 };
 
@@ -1154,7 +1154,7 @@ gpio_sim_bank_config_num_lines_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_bank_config_, num_lines);
 
-static struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
+static const struct configfs_attribute *const gpio_sim_bank_config_attrs[] = {
        &gpio_sim_bank_config_attr_chip_name,
        &gpio_sim_bank_config_attr_label,
        &gpio_sim_bank_config_attr_num_lines,
