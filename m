Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685789;
	b=UBk8q/8G3ImAX0Aev6EA9CQ0aQyez4YQ4YQnPeie9r7w7UVUo+mOUnOzFnPISE6w8FFe
	 d/4TyIyWO7MrFGIFmn9XanFXFMstUqSEffktcjVCkm1vraEl1I8KhrFsHumyZU2uP7Kio
	 tTl++idP1oqEwk1kfMoZo/Z8ntyV9GJim8m8Uojp6uQIzGeO9/AP7AT2P2+pqWtHaxu8m
	 rZCY1518Ik8TrOYtMzAkoNx9AosdRvsA6nLanC0qaLKKyqrKbolrbRy2KQDOyHneijC/t
	 FtdVHT0GUwi3sEjK+n7UQ+E+Uz8O1OQ+r0/DQ/VUCCD2xsBHV8dadzbB6UjwY9YgsoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
	b=fUN2PnMbNQbr/mlSVkmBzrBjGFud9/K5MSyxfAKlEtGwDoRYt/s29RHBsoc8Mb5E17kE
	 5XE3kckKpn4LJ5GFY+PhNvLVSd5nO/OaSQb1EPpQRUsAn/l5ehzD4vk/jQoRNJp+PyjBQ
	 v+88T6BdeI0tig1VzdH80refw6s2G1cgvfHRD/HRo7gAQmoPENEytj2/EI3lWMyenabKL
	 jYqZFAv5uv+x8o4/3aZTmcYqYLARfLemlbo7oQEk0nlh/8EDGQ1d8ZcjDFoQ49kLlFNWL
	 jnp9KHVWWMIQHdrZPSx9KdnmWoMYvYXFJeDxv0mIH4sOytCfgaDvRbYjKErP7RALGlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIXVhnzH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST010TGo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53A606A33C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C53A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIXVhnzH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ST010TGo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BAbb3548510
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=; b=NIXVhnzHgu082yqW
	abalWNzDOxFZhGuNyI7ByVWj6XtldAX6FNnRjk1R3+UFYJawEMNoJZxSHvaHd1aa
	y/lylYTrMZMQPJjTH1xQ+WuXNYh//2rPDLR8TVy7nTNgJKN8EYGHFJGqkbjlrfk2
	HmbGJ+iFyZOW7sIfJzapKHmwx2uBeRjpcei/L75cvpnGBtL5uyde+1cjyB3jPOdu
	eUKoWKk2JIwfQBAocqIGMVU9nxYYTmjxMaD6TznCOscivByzNo+H4jWYMNLqqPN7
	xOuOVl859J0HizB7ni5LBcLUFJU99ngJ6vbqAZbaG8iD6rDY7wb+XX5lPB06zm2C
	iAOWXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauad1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 09:36:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so276528485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685787; x=1796290587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=ST010TGo+ikyU8MVhQ+E8UTzGE/wik/S2XrcLddBG8RjEstLlS2CZyHIZGj2yibcM2
         ALscMSpxy4X67sPA8ye+mzGp4uezDvhDuaFrGW0QwwIEIHd+sBRgSExorA9Uf39do83q
         yqipOSHlVjcnhiZHbZ0Qk4jCsT0Rn+VPaZHK7cECmPWiGT2/+iij1RrCCDf1Atb8Ycxw
         CE0M0zHHfJp/ZOJzR/pAqssIoZH0/aOzri5Y5/hCswZy5k/Yuize3H5h1864GOBkkLsE
         1HsZHPIqtBqKpZMUpym1NtHp+XZw4rJOtAgS27rCm3lHv5+I4uB50yJaJnypRuavwEAc
         IdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685787; x=1796290587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05HkMf4ygIqtlQzRN7ZbpqVF0GJOazAPdTl6j41Coks=;
        b=y5hC6T8DVMGtnXQGOSawbr0cpMpINEgxXlQsvEQFJP2rr3iSYm4MFLgSHHIXTVc92o
         zyxfaGFCHxSHHEuXLdBXMF8fUY5QMk6frDv6+tn7/uTDoapSUKdcY7O2AFpFdMAcYAv6
         AXgkFGss6IkUDBqMuV8LNsRLdYbWLJticutGR/QczNu53BgcpiVLtUIDbkYHEM5rLKto
         DrTChrLK/TpPYq72XmSW+y/qJZjk0F4oayvmaVWd6g4iX39kP4iGBB0N0gW+rhr5WDfb
         QAe0c0yPhxR6stQAmxNJAu/MRJ4fZGo0rc1CDltU3FCRum6oUWCrRFWtqgUsvlVzGzSX
         xDuw==
X-Forwarded-Encrypted: i=1; AL+hErHcT+ZHpCX4vpRk0EIboYiZ5ykuisvxZC1MJJcGCkRIcr6rZt+4gEm4emlWzZIbY0XmmnapzEDoJTPz@vger.kernel.org
X-Gm-Message-State: APuU4Z8QP1NaMx/cTcxVG+9yBsck4ZsZOtwB03H7J0VsWcpImyP2OmAq
	9+adUXJTy2x+HWDwK5+Nw+Q8pr7TBVQs3YF/o94U7s6ew0i1zmdRKGrYtbzPulvRoBY4ehNwsvQ
	JflK518/zxM62Sn4nqiL3WR6H488GNigK2mjnZdFrNMevn4sUde982EcW5yz+3UQ2
X-Gm-Gg: AZFdTZdIE7XNNCuRz3ATcPaAumZ5XRQdc3C0FPGGYFimlITjdK5bztb4mRA0tX5SGmP
	+LC+snG/2k9TTCx+j3pf3gz9iAWNh+sysYGBdSVGp/FbhuwdL2Ow339RafyJL7jVNJD4oBtP8Te
	TXezQRH/WqOXhKoSieQt78F6UpGkSKnHuncn+vvA+coKJLMTBNdViT/u+F/VFQzLvTpuWtildcq
	63S95Ft4UnZeWFtoZVM5FKHhZNqBt1YmOFq4V3bmtbzKou04w3Dp953gYJiiJyXfVV5E5k1GBFZ
	zHQCAPyA9KAXTBiNowUqd2IYe88kOu8hwmcUGpLwKzFPBiv6Dtw4eX8O5E2s8NpMDHCmiRmmrdV
	JZL4m2cHYL8ngcT5UnwdEwSV6VmQAV4TyyyO87IVN/0sUw9gfZVqZESf8yqY90K5PGCFpZwKx4i
	CKHA==
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr3645415985a.80.1795685786730;
        Thu, 26 Nov 2026 01:36:26 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr3645411985a.80.1795685786268;
        Thu, 26 Nov 2026 01:36:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:18 +0100
Subject: [PATCH v4 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261126-fwnode-for-each-prop-v4-1-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hYScHpsRvvGBrMd1w71TLaQh4T+I7gIpjdQzKJBQdf0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2Tb3bU70k5uNCHd9DHKLI7AbP4/lR/4ThiP
 pB9xbKGQFmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9kwAKCRAFnS7L/zaE
 w0vSEACwAuSF5pl297MCgnmYK8Yx/HwO0ljwt+t8ccc8bpUGvx2jbcf2rDjTxnwzOuGQX68E9qn
 AHKXALKHUnUZS/uTHsbtEhU9F4S4EW14tOCqA87Giz5SHfWhgTfgKgwZoViFwveppCrg8NZmrLY
 X/WsJ04SptxP1NSU2RJee1r9IORHFOzFZMJLDbselGbIQp/qk5QQqmfzeo6+Epv3jRtF1c6dyYp
 sb0mR9B5mFraz3sfOPjX1fzbtwfVXoV4+AEOZY1pJglVaDPxvtLVhCl/rhloqFmCo7z6wp2cCSA
 OmlIfaokYSWE33yxltAu10AB8MZDBB9xm180nqQ+jQbeWSuuiay3N2RCjjsANEmiGBXqiWbSPk6
 Z+wKVa7f5yXFf65X0gO9RJ5bruxLNC7hhoSRxKImvqL2d+GvB8YukI90AadieAdyl35efNJtkOE
 RzLBI/RjMhlmOXY0iATAPVuOVb+kqAPJEVDhn41vM5hGekJ8Eak6iKn/PY0DEPbEt3M+Sz65fdJ
 U52WP61v0Uju2OXgKK97CxaYlpQTqws7Ija56y57kW3rzcUith+JsHzNgFqx5UUc6nobuKdur1G
 2IdeHPUaNO+jU8QPeRKkaQjxMYJeM3JJzyXoZLaTkhl4F/QDiU9WgZqOovcvQVmvEu+fHY/Ne0x
 GakZ0caFYJxEevw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX8QsRo4xgeZO8
 5nHDRF4oX1Rvzf5632Q81U1BqG03hDL/6MFr9rGo3Cq+XWH5WRX9j1ykwMtNCK7GYasHO9phFRT
 uttfDjRORC6YErCE2ZnDoiQOxKWRme4=
X-Proofpoint-ORIG-GUID: RHALDF4RowK9HSS8U87hhTmUIEQvA_Ep
X-Proofpoint-GUID: RHALDF4RowK9HSS8U87hhTmUIEQvA_Ep
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fd9b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX/yOnMsQeDpzG
 p7BmJYpTXS4pzmbo15+qmiMu04uahvuv6QcIFJISzXojsb06eBkjcMI37h7wFGch64tyV5Wuk1p
 Jl2xs03T46bCDfZlTjeSvCMG2HsplwEN/fhK5ZHhkvXBbgws1aaq2Muwxr6W7U6sXAvCA3mB3rt
 OwiErs26H5TEBSGXWSLHc17FiCyLz66Td40xXMHhDqodLn2NF6wWP6sQoxN/N99rFadVgP5mAd7
 aer4pY7DXRC6JaYIm8FDyp6Oz/c4Rxs7goAXLCmCJoSOfSVmfhs3eHf5dLnOLOfixH8ghIox61D
 dZw+UtCCiSTWXt79WXMV8PJ9JI1bHUO0DHEBIo3Kua/P6qd2C0mAsOBSgCKka83zJyvvInoOb6M
 13Mpb5ywKanU4mZbgerb50JcG2/BqEWt5yZZEBWLrNnac0KXeewzIMfn8vJnZ4akcmYq8NWAJnK
 SjWsRFCRDXDwQWsc0fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

