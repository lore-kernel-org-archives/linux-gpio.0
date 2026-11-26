Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685807;
	b=vQ/koiQmT0QIPXzQ7EZYIs6Z+1mXPzoVgMwm0N5xICpJt6rOtcItNjlpFLN2ncSLQB2s
	 QcxLRK7AZVkvNdRvDxpLnEOZr7jD/tHVmMPGlCkbQZ8608f0/UoZd9orWIDwVtTjx7Lbb
	 aIIi8zRYwanALvoSjyl2hlsb/414rn2GEjPyBRKZ4Mkh6cofeGRziAibMeG2SsKpW1gU6
	 iFu43avjkGYV0fTQdxCgjP++31sdrAtGvsCKx1ZfnXyz4Y3squue2xB6at6ljQloyTgna
	 y+h9P381A/KCGcUCYqvXyehWTsd1X5/jKfLPDva6nvtEGuw06ALWJoXf3Ec/iQRDwdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
	b=iQ3ZkO/d93bw698P6u0rMfkloF5b5Xm36W3dVew4JwznFIvw+bZK/KnWTCbQzHhrbJl1
	 JtGsftSWPbPZm/J0axyuw17NZRC7I7/fgYuU7j7HlRvwJmLm07iU6bNZtv0n/udJO2lIk
	 QgvvSgbSnnYMF4ZILosDqHkbI5ySQIzrc4VZF9KQDq1OuBw9wxWVRSHtWgQ1npzSCqTxT
	 7K38BOPf2dtrpoXPMfFPxHH2jyoNdgbfqjLBgDC/p9umPKuTQUCfbSOZW1EW/ZpC7rMmZ
	 cMa5yC8Qx0e0+kKwiMpAP1SpcnmRvhg6De9rVf0FtzXRW9e5r84oWUPnJS8itp6in+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cGlcuM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdZYbux1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8D60A2634
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A8D60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cGlcuM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdZYbux1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2xd1682403
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=; b=h+cGlcuMzvNibvmv
	CuHu4uSUESnjyED14sZPNgcLzWrSwYbOeaRBTH2HxXQ7ThH5SSfjUl3NHMt1THy4
	AakRTV6o/oXRwMHZo6UoqrH7lo9aoNCPQKgXieTCjhEQm048VEov1WJ1mkd8juAx
	IvVYoQrYXKatMHvWHYyGipGhl/qxAbziRaQwuTD/0zLsyxX2PkZ9whnbsIMttkxJ
	ZkwqMfHp59xDiVcPYGO6EmJVGTjJihYsiTfXO3gb7ZUq8B4WgpBIbclGcAIKzRN5
	4mq1Bre+aRNASOUKwM9OFGHDma4dz8vcMy5qqo3qrDtNv513uSvBU+YGkvn7fd7s
	8vVwcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekg58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so1027557185a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685805; x=1796290605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
        b=fdZYbux15QN+ZbRTMKTIgz8h/NxasSm08mEe2cQVH+JR8lYj8YgURmOXwi533C6OzH
         NXmps75yOMFI9jQXmw1VGch9RFFloivI0OBoil3IC96sUpHssGdxKzQvfrc/8B4WQh+3
         02txgf8LljGzPKP0U/4TsensZemu+0MMZ9MIg0k4ww6f5JYy4lNsgFJZbd/tBv0qc+cp
         aE6kd+IT5D1zmgDivxjnfzNlstbBxpKdxOIAd8BI72nuSymMiK4aNR1HAH5tBXPcoGcP
         nDZnm9RJbZ0UnHY2zJ3XVjkTmUn/9N2OVq27M1xRbgNfPnJxmzykOI+iXgFC47asgRda
         188g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685805; x=1796290605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SCNpw1s464Tzj5KlGBOIPi2TTigUkXEY2fLFA/8KRV0=;
        b=fEYspvsH4jrM/KsZh7XC4dlpap7zan3OYOj0y6BQPPMunxfNgNS7s87YCLYdc1nQdm
         8R/mQk9lGP2F/CwpZ2kaBbntXea9J71Za7vOHse+R24eVuZWWkqgqzsVPAoApR3inl+K
         sqTgOoyLFcs+X6S1A/EaEBPz+ho+S6VLjmPTjgwt56npTzqjIsxQXgrQ+jGkDWnl6u7K
         6S0fnUmoeMZrv+b4AcmjDM4uWE7+WxVq9St8uvY9sWPAtiSVtjlhcDnBpwT4/fhS9j4r
         KXoOgutQ33IuGOPsjQ8nwJEcqGOcl8b99rAFOKvgo/dz8q7eAh4vvdoBd4ST0PLADygE
         ABew==
X-Forwarded-Encrypted: i=1; AL+hErF9wiqxynsuNJIzbxZzInXBbCuplP0NYDTdHa9kFLDcLHM92zZtuCq5jETXoZ3Oj7bq7oFEO57F2p/u@vger.kernel.org
X-Gm-Message-State: APuU4Z+k62exKGxk0br3aPiY9TtFHsfeu2hNvUOEQ+m6/Fg+1EvkiR2D
	8bZPPZcW8pYYhDvZCu/IZ0Lgd1R05DrhTbRyRsxzUhyszcHE+GyTO4Wue148T5PFlGF0qzQ5gLL
	roxM7clW5K4sfQv2o/9v6QObaX44wQf1xKjt/XqKwq9S62P3QVZF9ULOlsJLf/c5J
X-Gm-Gg: AZFdTZfu7ulSFO44srOObwuyT5BW9N51Pi5IllEBaW3N2lXRHPkdGrBVP4GU7rMAXPg
	ZkkOwoYlOSUCZqW6ydWImwNTBx7ZmuzMsQzPue4BMlhooedsulaFwaHlqeKAAW3bomRnf9cf7+k
	APY9P09ZMragZFCXvjYf5dPn8YzHFS+YCBGQqNXdaCFeulADAHyB11jSjzh1O8u3C8n6JXrrPn5
	NRvxXoxAG6J/atUcO9mzX5gjXrD7YMvsWeeGod1mKwWrw1MkFLOF/zGujkRoSupQAAugiIle1iU
	7iJmYa7VKICGetfGDsrZgKW+q3ZDa27CUHv7L+vjVmgHBRzrAE5v174z74J4i3xyamXu7wIZhbE
	iENi+f8BAWloC832AJGfBmFkK7LYXYboZhVWmYCa/FAo3Obs5dg/a8WP13uJ1Z1Tm6s8pptCCGp
	C7Yg==
X-Received: by 2002:a05:620a:8089:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-949ba9e958amr3401669085a.57.1795685805643;
        Thu, 26 Nov 2026 01:36:45 -0800 (PST)
X-Received: by 2002:a05:620a:8089:b0:93f:2bca:2cd8 with SMTP id af79cd13be357-949ba9e958amr3401665385a.57.1795685805201;
        Thu, 26 Nov 2026 01:36:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:26 +0100
Subject: [PATCH v4 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-fwnode-for-each-prop-v4-9-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gyj/ChOHQ3GV+pAQrZI7Aj+LCmcubDcyu6k27uxVWmY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2VBGjpdW0iPoYV/IBOQcKz/c99bTgMGWmFJ
 hPaWhBDSTmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lQAKCRAFnS7L/zaE
 w2dLD/46O+avWuwJk9Y4HHE4uUZvv4Qhzk8ofwZbheAvceHO9A5+8+hnMqT1GPcjC1Ghe102OWL
 V6NrN8dfJ2N0wHI2zFaidHgJyPqMmuAMYPU6HpmXKugkvfYQGzOINhEwhrraBKJ2q8FJiCUpnaO
 xG9OsMATlw6jAkNHEWsMQdy8l2GP2rOcF5JrH6pKG3qgQwwv6yvU6cqGSnZqQdSjMRRRLZdaE+D
 e4zHr1OIn7dlMfISNCDVdTvFcvKfid89g3gKEuWf5SSGHai7RN3O2U/5LdD0cV+bsJK+lYTVj/u
 D/KUol5Ewc2vjstIWNY5PXxy+9d9vKfh3GVoCLpY5/Jr8QYZhq4siS7vjntc2GiJqX/S7izKu/b
 A4pVua45kTJPSWaXgUWmAziQRD9/pdOJ5MovSbbEKffL7+ECKyjLkyG0rPOQvMnLIaFpgzZlVnc
 AwP2Y4ssqWvQckzOGNuH5AK6LNzfnxI/NRN21fClpVInQHCd0q7rlsrOhCs1I+rdJ7N2PbsjD/P
 Z74VTIWGnZDHQFuJTEw1FzCNfHSu2kEHZLXty7vFOfxFHhtR+o5hBJv4hNYTJ+D9i1YDqCtesR7
 5a7mgaefuiaasCNWIZSdTgy/wWJbyeEMJ36vwc9q0HqEQYcuFbw1lXeNJ7608GR4+5gdwzdSf5l
 n08uKr14tH+EAdQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX9O5NMKOmWltb
 WGJFGED5soTyMvKO4GyMKAUTBi3D+uQUou6TgG+v8VDrH1U2qVxu4D0d9pq0HAiS1/tcnI1qhGt
 XzPZQPTWB72s/KnGcmM7I2WW7lKMGlrK/H+AkRjYRFFkX/Bpi4CUH+DAQfi9YCa1IsHNLEGIP7X
 FwIjCUlP2zVhFgNty1DxQ98jbXdOCyVfs6+FpwtcriRs4BOSrj4iIbvVYQ7D4LZnjEeNGbVx6P2
 wd6z1SLWU+/EvgG9oVRfsQ797j4LNJ9hqcRQVl/0IaqZQVPTWBvaPBK6jfO/7ygGQPdpW3F2b8I
 8vCJfc9ttkXsliBLJ+1aGK4KM8d4SJTpqB5cOt5Z+3bPSrmclcYstUmA4TBfhYzfLlzV2Vl/Avl
 K9M+0zlB4Q+qY1QeIipBSMxO2T9pjhxgtW4p+01FdQfI75MCYsb0Ly2AFMaQgWx1M87lH4rgXkZ
 DmLTTBThGKv3pKTwvUw==
X-Proofpoint-GUID: B5SwkhyUgtgEwWAp5IYiCdsaPRYpbm_-
X-Proofpoint-ORIG-GUID: B5SwkhyUgtgEwWAp5IYiCdsaPRYpbm_-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfXyLrmoCrsVdNI
 UbYUpL5CYhJHmYIhuWAOchb1EajX8xN9qWOzeIQhgk+SjgAM9IjdjgUw/9dY+ebBAEYk+WmS2BR
 lfRKqsXSlU7BdZZaIZuM1wBSlPE0kDg=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07fdae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 7f8b31ce4b9ecdff8cb8e34bdd546f44a21d9ed9..610d4b35d37c512eba6e8feab58dca2d9da0a152 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

