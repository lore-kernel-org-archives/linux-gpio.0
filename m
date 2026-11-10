Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304877;
	b=I9EYjUEmUCooa/Oe6KTCrROKOgIrUU8GWamSw0yYR2JaET0VyFEbhoxWJzMP+mTFl6Li
	 zziAGentSAAnvvBY3ajRx/Kaluh4rn7sR7Nf+0xlyDuelsmaVfBfVH00y+HGYFhG/H1FO
	 J79aGGQGtDxEDtuCtGX64GIpi7xPtK4r11R12J9QQ5oySwBwUjss6mpGxKR4c2OdqLdiU
	 RSy0JoKXZdzwq4SruJBbMFm3lUUzdGmDR9qka8v8kURRltZiPu0KLY2BbsG8Uf1nb7ku6
	 RbRbf9v8JnVoNZzt58wI4aKza4YuyyVe0FFGW0nR1DiPAYPyRrhqRMtPYNGQhJ4gk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tZFpc/WkJMO9wikzVpCrn1g7Bbk+kpMUXbvDudScemM=;
	b=F0bu4JbDGnE0YNECYYSvvNtpdb5TYeVKCwu4eZHR5fUieSHfu4XvBT9ESUqMTu7ymRlj
	 w9aBnN35cBz+rSD0AwgnG7iEBtnXJq3SUdjT2dycnSduN4Mjl+YlosxH3tqKcHvV/qEZy
	 jBhR8O347JIGviKR8SOnXUr0SPiIFT9Qn/Iid74rSKzSZm/8GD9OgJUm3KOye9jq5a6wT
	 qTyudGmw8yotesTaZrWJFOLztRStD31lT4x3cXz2+QnqDTMuaP7/XQIOpqTxr4TyELsb7
	 EMoP8FAp/medehFRTEe+jLIrFPFlIdbRH0ebbu/+DDeVtk92c/ghSzgfYm/Xpyu7jgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWEIKgPU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnIlr7x8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184DA606A332
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184DA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KWEIKgPU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jnIlr7x8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lL783403232
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tZFpc/WkJMO9wikzVpCrn1
	g7Bbk+kpMUXbvDudScemM=; b=KWEIKgPUzPqZa7IlXVpBuHgmrNM6zSxuRhm0PW
	8vweXNxBn1LrryqNnsraBaKJKIRWzxYfit10cE9hkr+DkR1QzgqdhigW5oNIN+Nn
	DZWfsy/TCDi+cgRHele+/CAvPJlbp91Iz3NeK8f+0rEHrX6L0OjGuQaMyfwNQ8bc
	sYgxZQ6wXZ1cAdgI62H0EmiUul5PsEiN3UEfnjHm4KVMliS0Z3PS/J8/E+XIbfPc
	IEfzWbep4Fr9DipxUclVrpXEmPk0EF9aPLtGmxUCYqXthFGgCaUNo/qDgffmEbXA
	xRaWAZ9GXMmsKER/crHL9TluLT7ADm/FOMNBGzPREALgO9Wg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx84742-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 10:01:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2dd8c5aeeso339163137.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 02:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304875; x=1794909675; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZFpc/WkJMO9wikzVpCrn1g7Bbk+kpMUXbvDudScemM=;
        b=jnIlr7x8+rR6YtmaFc010dp2hNyxjv/aFI98ItO5EK6BeG9RHobc2pDMhkM12Jv1u3
         PnzrwgmcIJGypmubT+XnoPvOYy5ZBibXHIZHaqKzxJl7usxuqNMNiK5/r4phHA2xmFjf
         walrvHvPcgpstIUeEJJCZBe1vZfZ01ojWlEMwX0ZC3tRvvk1ZC40eaK3SE9q8gzFsKqF
         A6malFBtREX3bxFjTigSepTBrOu6/KXcheoDmIYgbOb5GLdwKY9qCqiaNMuw8RDwhC7B
         LRBmdQMYRyU2T+tAJ5eT+5QaimPTKR8+1CKnD7rYm5TPC4jSvweB9377xDsX2QJVjFEt
         XZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304875; x=1794909675;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZFpc/WkJMO9wikzVpCrn1g7Bbk+kpMUXbvDudScemM=;
        b=EViJcIH4w43pJoV2q+LosPXOB1vmtQLpNqrlS1epF7shiuBQDrxVz7m1khkui3A297
         Z7koTiQRhjzobDsw+/Qv4DKiULR5r0G3FCWwk6AWzMAhwuiCvDQD6/XdIEknRD2x49Xf
         axYzlTuT/sOJySILQFDODvC87+cVcdvWEyVcksZ7AvOjORGoSQX4NghmvFJQedPrVqgp
         X6eU4a7yeWmjzztPeLW7mVtJrebvuingB7Ql1t6hPUOJ9H9eBe8RZuqEyLcmzfu7bYaz
         FpKIGxyLOl9XW6tgJwbeGQx+Y3ovt4ZubCu7lKd3yZiPDaVC69nh3OeUQFyJRML5OBOM
         8mIA==
X-Gm-Message-State: APuU4Z+5BrJxOXQc491ZF16CCZhYwkDkuwpIYH1ASsl9fMkYkTEKkHtE
	t6x3v9cVlbre7FVIMFTuluS81dmLMEFx9QK01R5tT+kbn0zHpVqhXbMX1YLgVT1SE2xUpFcbPiA
	e6VSdjKBd2R0+6BTlbEYphgzxQq6gAXSdGDJmf5IVwX7uDcn72PdsnthazYk8tkEcvonFh9Jn
X-Gm-Gg: AYBFou1uTpi8KXUKtWd2Le7QQ6JRh4I7JBrAzolxOVmFuly3fSFUeNWaJw4yL1WVLkc
	rrrUHnKwJRN1/Fw/bTosRBsoK6p8St7jWJ6yAYHom6RQkov7vmUhDnn3sSt4yx9ibgqkMOVzoQP
	VxeVGT/xFK8sZBnaBqHwsR3v27paUMkEVVNCV6BAQwM45nHZU70irEN7BQ1EA9aOiLEoJQKfqJN
	IIkl0bPxfAdbJANG/kwWXplAdvNJ+DhV0IGLiUyveZ3vZaxI9lJYP2N/yBpiq7BoQYlOgQLFsjc
	H0PNHRUMFEFWsoHbWeAFsjxQ6cXo6AsmjCC0/TRyTnHMv2Gz2ISXu0N1TnrWVKNUMVWTEbPFqzP
	+AgstVnq5cNXB9u1in0qFCO77c4r+UNg425bknEn4ifYNFHxqTzQy2o5DgbaVyIArsoCihR9pI3
	cHEvVZilOKvHhlh6i3v/SOj/4UGNQX+ADvTTPrXj8WT49Tim7TnzCZKDCOfwdR/kk=
X-Received: by 2002:a67:e706:0:b0:7c3:9daf:f949 with SMTP id ada2fe7eead31-7d301c09231mr582040137.30.1794304874964;
        Tue, 10 Nov 2026 02:01:14 -0800 (PST)
X-Received: by 2002:a67:e706:0:b0:7c3:9daf:f949 with SMTP id ada2fe7eead31-7d301c09231mr582034137.30.1794304874388;
        Tue, 10 Nov 2026 02:01:14 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02345d22sm62237715e9.1.2026.11.10.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:01:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:01:10 +0100
Subject: [PATCH v2] gpiolib: fix stack out-of-bounds access in
 gpiochip_add_hog()
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
Message-Id: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGXr8moC/42NQQ6CMBBFr0Jm7RAGaQmuvIdhUWqBieBgC0RDu
 LuVE7j5yfvJf3+D4Dy7AJdkA+9WDizPCPkpAdubZ+eQ75Ehz3JNlCnsJpaBG+ylwzAb+0Ar3i/
 THIdYnKnRRemMUhqiYvKu5fehv9WRew6z+M/xttKv/VO8EhKaojRtZRVVWl0lhPS1mMHKOKYxo
 N73/Qui5ZMzzwAAAA==
X-Change-ID: 20261105-gpiolib-hog-stack-corruption-431b647ea556
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2554;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v/8X3F8vcqvN5Gf9Fy76dzQlU9NwDR0+nvzxjnY/wHE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8utoMgN6tcgZ9HyTE1Rqqepa8AIQhBKooR35c
 jOZjVKqJdSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavLraAAKCRAFnS7L/zaE
 w6caD/9N3J6gWlPGfFR35AFO9PXblHaJnryYPrqM8XEwwAbXM+UvFVllzkTmbBQIXGBoEJGqz51
 MJGZ+Z/mVhS0Sk5vHgJHCHfoE2m2EA3P8nWIJ3H9yaw4cLXJNIcgJBeUQoyXgT5Lbj4cSxSS0MM
 d97/agdhWd/Tr53U9yD4weX1W+yPo9ZoJfH4Mq6f3hs7PC0eDOwlVf2FfcNrUr3wuydqYhdK0nm
 6wu2N+bFcNHFSNFtAA0n7Y0VfgJxWGQNPoAydVmU+qcio66PqJLduaKJVh/DKtGi4s+gaRn1F3Z
 gHFLbP1CWPN/0hzrfNc4s4UquUszPq1Bk05WwgXHozpke4iBBFmihaMKDPxcWeCoW3K+y+Hf3vr
 4rT/Zkbq//6L0VXofN4DeLT85DtVZ6MkNxxRF/G4Tae3NGen7X18sOJrL3LYUzremWIVbumFsME
 3nvnkHPDB0mZ8GtsMIyIR8sx+iy1LXcHOBxiFJB/rautgDGTv6jaaxVjwcSrvquABlCSZ59/j+x
 GFuNShbbSzxwaJh2CNcNYtYmXCNwIUi1Sz49h3m2rvRb+TKy7BVMnKIMMJhIZLDP8BT/IYYV6Do
 y2CRmDFI1N4vxKRtQjKCHMGbQANriue3xu96KOJjEjFyvmqvVgDS09sAdoMZBCO9lD1UMsXOH8M
 UVClq9i/nvcsoxQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2eb6c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5PSmYxW4pD4NZdMEaB0A:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: uKvhcifGZqjPCYUzKbPpQ-NhYC9V_kXu
X-Proofpoint-ORIG-GUID: uKvhcifGZqjPCYUzKbPpQ-NhYC9V_kXu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX+vvfLUvrQxY4
 2oDNirwxhGNIBRrFEB1KqGZef7Sha8bV8+2i2MMtt4P6lXNE7mpWPvCydSlm7AAMvqf9jogtp5I
 Dj/VtxKsWvbG8IZw/98xgainsAns0Yk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX51C83dyy4asb
 HASl4umoZnN9YP5DI30TucaI8MuvOJS6BWTnNt+PG+RXjr8/7HmSL8UR6Z+rqo8swgptqn/5JQ/
 PblrU4/ijQYKI/dNeLA9PgZOhG5otePlcZDF42lDaDVruWOitU2wacNCIUMckzMxA4HMyK/tG7L
 sDCu3Dvp3bCCKg7msUSY8Ib2iyRmUvcTtXH9I99ZHseRgcvPs/Oz6xneEjxvcLi+YFglQZ2IRdI
 +Bn1igzOoR3GCtfrzs9haE/YW5AJfUjGJElSiOzFr5I1lPm3LIRClulKp0NCfr3/xhBE5c8Vxoc
 J9O7JXrhF+rXhJAvRRYkUrzbc7ITExPw8LIXgBO/rHzHnPlr4IYdvWJ/C7Eq1S8s8joxSVwX7gO
 WZZI/Su+33Fs4qvv53kr5Eu6kFrOC3dqJzMsktjcs+/k3dFb16iBTL5Brj6K1plRKQhb1cTY+3R
 ovE+daLLi2R484pHokg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100039

In gpiochip_add_hog(), parsing a device tree with an excessively large
"#gpio-cells" property causes a stack out-of-bounds write when populating
the GPIO specification.

The value read from #gpio-cells is used to copy the values into right
places in struct fwnode_reference_args but that struct's args field is
an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
make the loop write past the end of that array.

If #gpio-cells is 0, we can trigger a divide-by-zero later when
calculating the actual number of hogs.

If #gpio-cells is 1, we can also perform an out-of-bounds read of
the "gpios" array.

Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS, lower than 1
and make sure #gpio-cells is larger than 1 before checking the
active-low flag.

Cc: stable@vger.kernel.org
Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951374
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix a potential divide-by-zero bug too (sashiko)
- Fix an off-by-one bug for #gpio-cells == 1
- Link to v1: https://patch.msgid.link/20261105-gpiolib-hog-stack-corruption-v1-1-a47af9c51965@oss.qualcomm.com
---
 drivers/gpio/gpiolib.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9282d9874e1109b7f030a3e83598ad016c2bf629..a11e65be476142e082ce76ffd2788c3cbe82d08f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -986,6 +986,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
 	if (ret && is_of_node(fwnode))
 		return ret;
+	if (cells < 1 || cells > NR_FWNODE_REFERENCE_ARGS)
+		return -EINVAL;
 	if (argc % cells)
 		return -EINVAL;
 
@@ -1041,9 +1043,10 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 		} else {
 			/*
 			 * GPIO_ACTIVE_LOW is currently the only lookup flag
-			 * supported for non-OF firmware nodes.
+			 * supported for non-OF firmware nodes and it must live
+			 * in the second cell.
 			 */
-			if (gpios[i * cells + 1])
+			if (cells > 1 && gpios[i * cells + 1])
 				lflags |= GPIO_ACTIVE_LOW;
 		}
 

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261105-gpiolib-hog-stack-corruption-431b647ea556

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

