Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165272F5337
	for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2026 03:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789183615; cv=none; b=F7pdP6J9vQ2xEbl0yYwIFM8Zv+7U+d/P0/C+UN6pRxWaTgRUJ6f2f8+VQOzzvkJ7CI/6wF2rQa+Cw7QWlWSAkLpscV70MDkT3vOcp/kpq3aARAZP9nFqsJh6ZYm0cKYFOLz6F1ExUCFjkua4RB+HP2SacaG+Jr51yYWhIdvDKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789183615; c=relaxed/simple;
	bh=MPCNwBp5FkYDqs0V1o1Vs4fXd5IIRrTa+KavVBgYSR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGUhMNiwRpd/1GH/QmVrX90bs0pPuDDCRCLLTmkkOMwjdPLvFy7EyhjNOquzoBXEej+vlIB8PANRiCqZwBR/8XYa0NNoP0jejTeEDrj8BorDNb+AmgvRMGV/EttKq9b+3FgIoBLenlCAoVg5olGrLlSO8aB3qarEuwsbGoT+qng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev; spf=pass smtp.mailfrom=q-lab.dev; dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b=bumlszwb; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=QsIU2I1w; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=q-lab.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q-lab.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q-lab.dev header.i=@q-lab.dev header.b="bumlszwb";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="QsIU2I1w"
DKIM-Signature: a=rsa-sha256; b=bumlszwbiU/nL74wGeM1/hFZb7H/7FMLzG2fkzYdg2ezbeD5jUD/b+/a+6bBMjm3LoVo7qMj/Gm76OsJfIbBJ5baXrHRWdvlFwFTQfaFX8TNGvYNlCZCIe4n/jIQJWe57k9f5GHNUSOGZEu811HaoE7yekNq/FOJu8Mpw8VTtlumTE2wmkEa/mXOo8CyhPa6J6i4/5722VduPySIpEgmwmvD4N5TY37cN+xfwfZ01xEGYzhmY4RWK+e/ebA02jFj7yHUXh2OYvS3+L8yEvU5/ukU/gyYdF5b/t47yYSes2M7dES6HEq2VCrG849EIkxw12bQAWy57U/vphwmtdxKVw==; s=purelymail1; d=q-lab.dev; v=1; bh=MPCNwBp5FkYDqs0V1o1Vs4fXd5IIRrTa+KavVBgYSR4=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=QsIU2I1wMPOvjUiijhBV80LJ7qrEz+6niB3SHV9iMAOEPOWYU+NNTKO28k8WCjOwSRE6EvA2aeMTVCCHy24+VtMhIfHsME3Gi9Xv3kFVVIeqYwQk3jWHOgCWvk+5b7K9bxqTfZlFVFGr9lpiApGmZFrMsz8+yMEoNxDDisDAdKdHUDaIeWf5kWaqxKl+80xWAp4NgZ7hCXt+zPAwEsz4MfwKF1nxIbgJH8IHAdDAOI3AcbawFRw7Ew49oR88927L+M7c86Im4d7d6USHQS0XxqW4tYzHgr1QcU/aAhixvzWwt7rol5LdeKhi8cuH7ZjQpJJbXk/Ow/eSTpyUPgGaoQ==; s=purelymail1; d=purelymail.com; v=1; bh=MPCNwBp5FkYDqs0V1o1Vs4fXd5IIRrTa+KavVBgYSR4=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 284201:25281:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1510296314;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 12 Sep 2026 03:26:22 +0000 (UTC)
Message-ID: <76b9381d-dcd6-40d3-84f2-661413f56521@q-lab.dev>
Date: Fri, 11 Sep 2026 20:26:20 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v17 15/22] media: i2c: add Maxim GMSL2/3 deserializer
 framework
To: dumitru.ceclan@analog.com,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-15-002499e534e8@analog.com>
Content-Language: en-US
From: Quentin Freimanis <quentin@q-lab.dev>
In-Reply-To: <20260909-gmsl2-3_serdes-v17-15-002499e534e8@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dumitru,

On 2026-09-09 6:27 a.m., Dumitru Ceclan via B4 Relay wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
>

<snip>

> +static int max_des_init_link_ser_xlate(struct max_des_priv *priv,
> +				       struct max_des_link *link,
> +				       struct i2c_adapter *adapter,
> +				       u8 power_up_addr, u8 new_addr)
> +{
> +	struct max_des *des = priv->des;
> +	u8 addrs[] = { power_up_addr, new_addr };
> +	u8 current_addr;
> +	int ret;
> +
> +	if (des->ops->select_links) {
> +		ret = des->ops->select_links(des, BIT(link->index));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = max_ser_wait_for_multiple(adapter, addrs, ARRAY_SIZE(addrs),
> +					&current_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to wait for serializer at 0x%02x or 0x%02x: %d\n",
> +			power_up_addr, new_addr, ret);
> +		return ret;
> +	}
> +
> +	ret = max_ser_reset(adapter, current_addr);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to reset serializer: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = max_ser_wait(adapter, power_up_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to wait for serializer at 0x%02x: %d\n",
> +			power_up_addr, ret);
> +		return ret;
> +	}
> +
> +	ret = max_ser_change_address(adapter, power_up_addr, new_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to change serializer from 0x%02x to 0x%02x: %d\n",
> +			power_up_addr, new_addr, ret);
> +		return ret;
> +	}
> +
> +	ret = max_ser_wait(adapter, new_addr);
> +	if (ret) {
> +		dev_err(priv->dev,
> +			"Failed to wait for serializer at 0x%02x: %d\n",
> +			new_addr, ret);
> +		return ret;
> +	}
> +
> +	if (des->info->fix_tx_ids) {
> +		ret = max_ser_fix_tx_ids(adapter, new_addr);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int max_des_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des = priv->des;
> +	unsigned int i;
> +	int ret;
> +
> +	if (des->ops->init) {
> +		ret = des->ops->init(des);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (des->ops->set_enable) {
> +		ret = des->ops->set_enable(des, false);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < des->info->num_phys; i++) {
> +		struct max_des_phy *phy = &des->phys[i];
> +
> +		if (phy->enabled) {
> +			ret = des->ops->init_phy(des, phy);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = des->ops->set_phy_enable(des, phy, phy->enabled);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < des->info->num_pipes; i++) {
> +		struct max_des_pipe *pipe = &des->pipes[i];
> +		struct max_des_link *link = &des->links[pipe->link_id];
> +
> +		ret = des->ops->set_pipe_enable(des, pipe, false);
> +		if (ret)
> +			return ret;
> +
> +		if (des->ops->set_pipe_tunnel_enable) {
> +			ret = des->ops->set_pipe_tunnel_enable(des, pipe, false);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (des->ops->set_pipe_stream_id) {
> +			ret = des->ops->set_pipe_stream_id(des, pipe, pipe->stream_id);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		if (des->ops->set_pipe_link) {
> +			ret = des->ops->set_pipe_link(des, pipe, link);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = max_des_set_pipe_remaps(priv, pipe, pipe->remaps,
> +					      pipe->num_remaps);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!des->ops->init_link)
> +		return 0;
> +
> +	for (i = 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link = &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		ret = des->ops->init_link(des, link);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void max_des_ser_find_version_range(struct max_des *des, int *min, int *max)
> +{
> +	unsigned int i;
> +
> +	*min = MAX_SERDES_GMSL_MIN;
> +	*max = MAX_SERDES_GMSL_MAX;
> +
> +	if (!des->info->needs_single_link_version)
> +		return;
> +
> +	for (i = 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link = &des->links[i];
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		if (!link->ser_xlate.en)
> +			continue;
> +
> +		*min = *max = link->version;
> +
> +		return;
> +	}
> +}
> +
> +static unsigned int max_des_enabled_links_mask(struct max_des *des)
> +{
> +	unsigned int mask = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link = &des->links[i];
> +
> +		if (link->enabled)
> +			mask |= BIT(link->index);
> +	}
> +
> +	return mask;
> +}
> +
> +static int max_des_ser_attach_addr(struct max_des_priv *priv, u32 chan_id,
> +				   u16 addr, u16 alias)
> +{
> +	struct max_des *des = priv->des;
> +	struct max_des_link *link = &des->links[chan_id];
> +	unsigned int mask;
> +	int i, min, max;
> +	int ret = -ENOENT;
> +	int err;
> +
> +	max_des_ser_find_version_range(des, &min, &max);
> +
> +	if (link->ser_xlate.en) {
> +		dev_err(priv->dev, "Serializer for link %u already bound\n",
> +			link->index);
> +		return -EINVAL;
> +	}
> +
> +	for (i = max; i >= min; i--) {
> +		if (!(des->info->versions & BIT(i)))
> +			continue;
> +
> +		if (des->ops->set_link_version) {
> +			ret = des->ops->set_link_version(des, link, i);
> +			if (ret)
> +				goto out_select_links;
> +		}
> +
> +		ret = max_des_init_link_ser_xlate(priv, link, priv->client->adapter,
> +						  addr, alias);
> +		if (!ret)
> +			break;
> +	}
> +
> +	if (ret) {
> +		dev_err(priv->dev, "Cannot find serializer for link %u\n",
> +			link->index);
> +		ret = -ENOENT;
> +		goto out_select_links;
> +	}
> +
> +	link->version = i;
> +	link->ser_xlate.src = alias;
> +	link->ser_xlate.dst = addr;
> +	link->ser_xlate.en = true;
> +
> +out_select_links:
> +	if (!des->ops->select_links)
> +		return ret;
> +
> +	mask = max_des_enabled_links_mask(des);
> +	err = des->ops->select_links(des, mask);
> +	if (err)
> +		dev_warn(priv->dev, "Failed to restore link selection: %d\n",
> +			 err);
> +
> +	return ret;
> +}
> +
> +static int max_des_ser_atr_attach_addr(struct i2c_atr *atr, u32 chan_id,
> +				       u16 addr, u16 alias)
> +{
> +	struct max_des_priv *priv = i2c_atr_get_driver_data(atr);
> +
> +	return max_des_ser_attach_addr(priv, chan_id, addr, alias);
> +}
> +
> +static void max_des_ser_atr_detach_addr(struct i2c_atr *atr, u32 chan_id, u16 addr)
> +{
> +	/* Don't do anything. */
> +}
> +
> +static const struct i2c_atr_ops max_des_i2c_atr_ops = {
> +	.attach_addr = max_des_ser_atr_attach_addr,
> +	.detach_addr = max_des_ser_atr_detach_addr,
> +};
> +
> +static void max_des_i2c_atr_deinit(struct max_des_priv *priv)
> +{
> +	struct max_des *des = priv->des;
> +	unsigned int i;
> +
> +	for (i = 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link = &des->links[i];
> +
> +		/* Deleting adapters that haven't been added does no harm. */
> +		i2c_atr_del_adapter(priv->atr, link->index);
> +	}
> +
> +	i2c_atr_delete(priv->atr);
> +	priv->atr = NULL;
> +}
> +
> +static int max_des_i2c_atr_init(struct max_des_priv *priv)
> +{
> +	struct max_des *des = priv->des;
> +	unsigned int mask = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!i2c_check_functionality(priv->client->adapter,
> +				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> +		return -ENODEV;
> +
> +	priv->atr = i2c_atr_new(priv->client->adapter, priv->dev,
> +				&max_des_i2c_atr_ops, des->info->num_links,
> +				I2C_ATR_F_STATIC | I2C_ATR_F_PASSTHROUGH);
> +	if (IS_ERR(priv->atr))
> +		return PTR_ERR(priv->atr);
> +
> +	i2c_atr_set_driver_data(priv->atr, priv);
> +
> +	for (i = 0; i < des->info->num_links; i++) {
> +		struct max_des_link *link = &des->links[i];
> +		struct i2c_atr_adap_desc desc = {
> +			.chan_id = i,
> +		};
> +
> +		if (!link->enabled)
> +			continue;
> +
> +		ret = i2c_atr_add_adapter(priv->atr, &desc);
> +		if (ret)
> +			goto err_add_adapters;
> +	}
> +
> +	if (des->ops->select_links) {
> +		mask = max_des_enabled_links_mask(des);
> +
> +		ret = des->ops->select_links(des, mask);
> +		if (ret) {
> +			dev_warn(priv->dev, "Failed to select links: %d\n", ret);
> +
> +			goto err_add_adapters;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_add_adapters:
> +	max_des_i2c_atr_deinit(priv);
> +
> +	return ret;
> +}
> +

I was able to create a race condition during driver probe when using i2c 
ATR.

My setup has 1x MAX96724 + 4x MAX96717 + 4x distinct camera sensors

NOTE: I am using this series on an older kernel release, with my own 
non-mainline camera drivers. Although as far as I can tell this can 
still happen on the latest media.git with mainlined camera drivers.

Here is an example I observed on my setup:
+------------------------------+------------------------------+
| Thread 1                     | Thread 2                     |
+------------------------------+------------------------------+
| deser probes                 |                              |
+------------------------------+------------------------------+
| max_des_i2c_atr_init()       |                              |
+------------------------------+------------------------------+
| first iteration of           |                              |
| for (i = 0; i <              |                              |
| des->info->num_links; i++)   |                              |
+------------------------------+------------------------------+
| i2c_atr_add_adapter() called |                              |
| on link 0                    |                              |
+------------------------------+------------------------------+
| i2c_add_adapter() called for |                              |
| link 0                       |                              |
+------------------------------+------------------------------+
| max_des_ser_atr_attach_addr()|                              |
| called for serializer 0      |                              |
+------------------------------+------------------------------+
| all other links are          |                              |
| disabled to change ser 0's   |                              |
| address, then all re-        |                              |
| enabled again in             |                              |
| max_des_init_link_ser_xlate()|                              |
+------------------------------+------------------------------+
| the seralizer is left unbound|                              |
| because the module is not    |                              |
| loaded yet                   |                              |
+------------------------------+------------------------------+
| second iteration of          |                              |
| for (i = 0; i <              |                              |
| des->info->num_links; i++)   |                              |
+------------------------------+------------------------------+
| i2c_atr_add_adapter called   |                              |
| on link 1                    |                              |
+------------------------------+------------------------------+
| i2c_add_adapter called for   |                              |
| link 1                       |                              |
+------------------------------+------------------------------+
| max_des_ser_atr_attach_addr()| max96717.ko loads, and the   |
| called for serializer 1      | driver probes                |
+------------------------------+------------------------------+
| all other links are          |                              |
| disabled in                  |                              |
| max_des_init_link_ser_xlate  |                              |
| to change serializer 1's     |                              |
| address                      |                              |
+------------------------------+------------------------------+
| we write the new i2c         | camera 0 probes (module      |
| address to serializer 1      | already loaded)              |
+------------------------------+------------------------------+
|                              | camera driver requests a     |
|                              | reset gpio on serializer 0   |
+------------------------------+------------------------------+
|                              | max96717.ko does a i2c       |
|                              | write on link 0, which       |
|                              | fails since it was disabled  |
+------------------------------+------------------------------+
|                              | -EIO                         |
+------------------------------+------------------------------+
| all links re-enabled in      |                              |
| max_des_init_link_ser_xlate  |                              |
+------------------------------+------------------------------+
| max96717.ko is loaded so we  |                              |
| probe serializer 1           |                              |
| now                          |                              |
+------------------------------+------------------------------+
| camera 1 probes              |                              |
| (different driver)           |                              |
+------------------------------+------------------------------+

As a quick hack I fixed this in my local tree by modifying i2c-atr.c to 
lock atr->lock in i2c_atr_attach_addr() and i2c_atr_detach_addr().

After writing this out I realized there might also be another way:
In max_des_init_link_ser_xlate() skip disabling links that have already 
had their serializer changed to a new, unique address. This would also 
require changing select_links to not reset all links connected to the 
deseralizer. Not sure if that is possible.

- Quentin

<snip>



