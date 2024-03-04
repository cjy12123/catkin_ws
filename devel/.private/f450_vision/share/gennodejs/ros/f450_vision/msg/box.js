// Auto-generated. Do not edit!

// (in-package f450_vision.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class box {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.box_center_X = null;
      this.box_center_Y = null;
      this.box_center_W = null;
      this.box_center_H = null;
    }
    else {
      if (initObj.hasOwnProperty('box_center_X')) {
        this.box_center_X = initObj.box_center_X
      }
      else {
        this.box_center_X = 0.0;
      }
      if (initObj.hasOwnProperty('box_center_Y')) {
        this.box_center_Y = initObj.box_center_Y
      }
      else {
        this.box_center_Y = 0.0;
      }
      if (initObj.hasOwnProperty('box_center_W')) {
        this.box_center_W = initObj.box_center_W
      }
      else {
        this.box_center_W = 0.0;
      }
      if (initObj.hasOwnProperty('box_center_H')) {
        this.box_center_H = initObj.box_center_H
      }
      else {
        this.box_center_H = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type box
    // Serialize message field [box_center_X]
    bufferOffset = _serializer.float32(obj.box_center_X, buffer, bufferOffset);
    // Serialize message field [box_center_Y]
    bufferOffset = _serializer.float32(obj.box_center_Y, buffer, bufferOffset);
    // Serialize message field [box_center_W]
    bufferOffset = _serializer.float32(obj.box_center_W, buffer, bufferOffset);
    // Serialize message field [box_center_H]
    bufferOffset = _serializer.float32(obj.box_center_H, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type box
    let len;
    let data = new box(null);
    // Deserialize message field [box_center_X]
    data.box_center_X = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [box_center_Y]
    data.box_center_Y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [box_center_W]
    data.box_center_W = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [box_center_H]
    data.box_center_H = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'f450_vision/box';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f1a4a641427c15bc39cb4de0679f2e54';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 box_center_X
    float32 box_center_Y
    float32 box_center_W
    float32 box_center_H
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new box(null);
    if (msg.box_center_X !== undefined) {
      resolved.box_center_X = msg.box_center_X;
    }
    else {
      resolved.box_center_X = 0.0
    }

    if (msg.box_center_Y !== undefined) {
      resolved.box_center_Y = msg.box_center_Y;
    }
    else {
      resolved.box_center_Y = 0.0
    }

    if (msg.box_center_W !== undefined) {
      resolved.box_center_W = msg.box_center_W;
    }
    else {
      resolved.box_center_W = 0.0
    }

    if (msg.box_center_H !== undefined) {
      resolved.box_center_H = msg.box_center_H;
    }
    else {
      resolved.box_center_H = 0.0
    }

    return resolved;
    }
};

module.exports = box;
