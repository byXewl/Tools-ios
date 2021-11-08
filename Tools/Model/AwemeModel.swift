//
//  AwemeModel.swift
//
//
//  Created by JSONConverter on 2021/11/07.
//  Copyright © 2021年 JSONConverter. All rights reserved.
//

import Foundation
import HandyJSON

class AwemeModel: BaseModel {
	var author = AwemeModelAuthor()
	var aweme_id = ""
	var aweme_type: Int = 0
	var cha_list = ""
	var comment_list = ""
	var desc = ""
	var geofencing = ""
	var image_infos = ""
	var images = ""
	var label_top_text = ""
	var long_video = ""
	var promotions = ""
	var statistics = AwemeModelStatistics()
	var video = AwemeModelVideo()
	var video_labels = ""
	var video_text = ""

	
}

class AwemeModelStatistics: BaseModel {
	var aweme_id = ""
	var comment_count: Int = 0
	var digg_count: Int = 0
	var forward_count: Int = 0
	var play_count: Int = 0
	var share_count: Int = 0

	
}

class AwemeModelAuthor: BaseModel {
	var avatar_larger = AwemeModelAuthorAvatar_larger()
	var avatar_medium = AwemeModelAuthorAvatar_medium()
	var avatar_thumb = AwemeModelAuthorAvatar_thumb()
	var aweme_count: Int = 0
	var custom_verify = ""
	var enterprise_verify_reason = ""
	var favoriting_count: Int = 0
	var follow_status: Int = 0
	var follower_count: Int = 0
	var followers_detail = ""
	var following_count: Int = 0
	var geofencing = ""
	var has_orders: Bool = false
	var is_ad_fake: Bool = false
	var is_gov_media_vip: Bool = false
	var nickname = ""
	var platform_sync_info = ""
	var policy_version = ""
	var rate: Int = 0
	var region = ""
	var sec_uid = ""
	var secret: Int = 0
	var short_id = ""
	var signature = ""
	var story_open: Bool = false
	var total_favorited = ""
	var type_label = [Int]()
	var uid = ""
	var unique_id = ""
	var user_canceled: Bool = false
	var verification_type: Int = 0
	var video_icon = AwemeModelAuthorVideo_icon()
	var with_commerce_entry: Bool = false
	var with_fusion_shop_entry: Bool = false
	var with_shop_entry: Bool = false

	
}

class AwemeModelAuthorAvatar_medium: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelAuthorAvatar_thumb: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelAuthorAvatar_larger: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelAuthorVideo_icon: BaseModel {
	var uri = ""

	
}

class AwemeModelVideo: BaseModel {
	var bit_rate = ""
	var cover = AwemeModelVideoCover()
	var download_addr = AwemeModelVideoDownload_addr()
	var duration: Int = 0
	var dynamic_cover = AwemeModelVideoDynamic_cover()
	var has_watermark: Bool = false
	var height: Int = 0
	var origin_cover = AwemeModelVideoOrigin_cover()
	var play_addr = AwemeModelVideoPlay_addr()
	var play_addr_lowbr = AwemeModelVideoPlay_addr_lowbr()
	var ratio = ""
	var vid = ""
	var width: Int = 0

	
}

class AwemeModelVideoPlay_addr: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelVideoDynamic_cover: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelVideoCover: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelVideoPlay_addr_lowbr: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelVideoOrigin_cover: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}

class AwemeModelVideoDownload_addr: BaseModel {
	var uri = ""
	var url_list = [String]()

	
}
